import { rmSync } from 'fs';
import * as fs from 'fs/promises';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';
import pino from 'pino';
import * as baileys from '@whiskeysockets/baileys'; // Import all as 'baileys'
const {
    proto, // Now available directly from 'baileys'
    WAMessageContent, // Now available directly from 'baileys'
    makeWASocket,
    useMultiFileAuthState,
    Browsers,
    DisconnectReason,
    delay,
    getContentType,
    fetchLatestBaileysVersion,
    getChatId,
    makeInMemoryStore
} = baileys; // Destructure all necessary functions/objects from the main 'baileys' object


import { toDataURL } from 'qrcode';
import axios from 'axios';

// Ensure this path is correct for your custom store.
// Note: This 'makeFileStore' is currently imported but not directly used by 'createSession' in your provided code
// after fixing the 'makeInMemoryStore' error.
import { makeFileStore } from './whatsapp_file_store.js'; 

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const response = (res, status, success, message, data = {}) => {
    console.log(`[Response] Status: ${status}, Success: ${success}, Message: ${message}`, data);
    if (res && !res.headersSent) {
        if (typeof res.status === 'function') {
            res.status(status).json({ success, message, data });
        } else {
            console.log('Warning: `res` object does not have a .status method. Cannot send full HTTP response.');
        }
    }
}

const setDeviceStatus = (sessionId, status) => {
    console.log(`[Device Status] Session ${sessionId} status set to: ${status}`);
};

const sessions = new Map();
const retries = new Map();

const sessionsDir = (sessionId = '') => {
    return join(__dirname, 'sessions', sessionId ? sessionId : '');
};

const isSessionExists = (sessionId) => {
    return sessions.has(sessionId);
};

const shouldReconnect = (sessionId) => {
    let maxRetries = parseInt(process.env.MAX_RETRIES ?? 0);
    let attempts = retries.get(sessionId) ?? 0;

    maxRetries = maxRetries < 1 ? 1 : maxRetries;

    if (attempts < maxRetries) {
        ++attempts;

        console.log('Reconnecting...', { attempts, sessionId });
        retries.set(sessionId, attempts);

        return true;
    }

    return false;
};

const createSession = async (sessionId, isLegacy = false, res = null) => {
    const sessionFile = (isLegacy ? 'legacy_' : 'md_') + sessionId + (isLegacy ? '.json' : '')

    const logger = pino({ level: 'warn' })
    const store = makeFileStore(sessionsDir(`${sessionId}_store.json`));


    let state, saveState

    if (isLegacy) {
      // This branch for legacy single-file auth is typically not used with multi-device Baileys
      // You might consider removing or updating this if your project is purely multi-device
    } else {
        ;({ state, saveCreds: saveState } = await useMultiFileAuthState(sessionsDir(sessionFile)))
    }

    // Fetch the latest Baileys version to ensure compatibility with WhatsApp servers
    const { version, isLatest } = await fetchLatestBaileysVersion();
    console.log(`Using WhatsApp version ${version.join('.')}, isLatest: ${isLatest}`);

    /**
     * @type {import('@whiskeysockets/baileys').CommonSocketConfig}
     */
    const waConfig = {
        auth: state,
        version, // Use dynamically fetched version instead of hardcoded
        printQRInTerminal: false,
        logger,
        browser: Browsers.ubuntu('Chrome'), // Sets user agent to Chrome on Ubuntu
        keepAliveIntervalMs: 30000, // Send keepalive pings every 30 seconds to prevent timeout
        syncFullHistory: false, // Don't sync full history to reduce initial load
        markOnlineOnConnect: true, // Mark as online when connecting
        patchMessageBeforeSending: (message) => {
                const requiresPatch = !!(
                     message.buttonsMessage ||
                     message.listMessage
                );
                if (requiresPatch) {
                    message = {
                        viewOnceMessage: {
                            message: {
                                messageContextInfo: {
                                    deviceListMetadataVersion: 2,
                                    deviceListMetadata: {},
                                },
                                ...message,
                            },
                        },
                    };
                }

                return message;
            },
    }

    /**
     * @type {import('@whiskeysockets/baileys').AnyWASocket}
     */
    const wa = makeWASocket(waConfig)

    if (!isLegacy) {
        store.readFromFile(sessionsDir(`${sessionId}_store.json`)) // Reads chat/contact/message history from file
        store.bind(wa.ev) // Binds the in-memory store to Baileys events for updates

        // Save store periodically to prevent data loss
        const storeInterval = setInterval(() => {
            try {
                store.writeToFile(sessionsDir(`${sessionId}_store.json`));
            } catch (err) {
                console.error(`Error in periodic store save for session ${sessionId}:`, err);
            }
        }, 60000); // Save every 60 seconds

        // Store the interval reference so we can clear it later
        sessions.set(sessionId, { ...wa, store, isLegacy, storeInterval });
    } else {
        sessions.set(sessionId, { ...wa, store, isLegacy });
    }

    wa.ev.on('creds.update', saveState) // Saves authentication credentials

    wa.ev.on('chats.set', ({ chats }) => {
        if (isLegacy) {
            // This part is for legacy store. For multi-device, store.bind(wa.ev) should handle this.
            store.chats.insertIfAbsent(...chats) 
        }
    })

    // This section listens for incoming messages for auto-reply/webhook purposes
    wa.ev.on('messages.upsert', async (messages) => {
        try{
            const message = messages.messages[0];
            
            if (message.key.fromMe == false && messages.type == 'notify') {
                const received_data=[];
                
                let parseId = message.key.remoteJid.split("@");
                let splitId = parseId[1] ?? null;

                let isGroup = splitId == 's.whatsapp.net' ? false : true;
                
                if (message != '' && isGroup == false) {
                    // Collect relevant data from incoming message
                    received_data['remote_id'] = message.key.remoteJid;
                    received_data['sessionId'] = sessionId;
                    received_data['message_id'] = message.key.id;
                    received_data['message'] = message.message;
                    
                    // Assuming sentWebHook function exists elsewhere (e.g., in your main app.js or similar)
                    // This sends the data to your Laravel backend for processing auto-replies
                    // You might need to import or define sentWebHook if it's not global or passed in.
                    // For now, let's assume it's available.
                    sentWebHook(sessionId, received_data); 
                }
            }
        }
        catch(e){
            console.error("Error processing incoming message:", e);
        }
    });
    
    wa.ev.on('connection.update', async (update) => {
        const { connection, lastDisconnect, qr } = update; // Destructure qr directly
        const statusCode = lastDisconnect?.error?.output?.statusCode;

        if (connection === 'connecting') {
            console.log(`Session ${sessionId} is connecting...`);
        }

        if (connection === 'open') {
            retries.delete(sessionId);
            setDeviceStatus(sessionId, 1); // Set status to connected
            console.log(`Session ${sessionId} opened successfully.`);

            // Save store to persist connection state
            if (!isLegacy && store) {
                try {
                    store.writeToFile(sessionsDir(`${sessionId}_store.json`));
                } catch (err) {
                    console.error(`Error saving store for session ${sessionId}:`, err);
                }
            }
        }

        if (connection === 'close') {
            setDeviceStatus(sessionId, 0); // Set status to disconnected
            console.log(`Session ${sessionId} closed. Reason: ${DisconnectReason[statusCode] || statusCode}`);

            // Clear the periodic store save interval if it exists
            const existingSession = sessions.get(sessionId);
            if (existingSession && existingSession.storeInterval) {
                clearInterval(existingSession.storeInterval);
            }

            // Remove the old session from memory before attempting to reconnect
            sessions.delete(sessionId);

            if (statusCode === DisconnectReason.loggedOut || !shouldReconnect(sessionId)) {
                if (res && !res.headersSent) {
                    response(res, 500, false, 'Unable to create session or session logged out.')
                }
                console.log(`Deleting session ${sessionId} due to logged out or max retries.`);
                return deleteSession(sessionId, isLegacy);
            }

            setTimeout(
                () => {
                    console.log(`Attempting to reconnect session ${sessionId}...`);
                    createSession(sessionId, isLegacy, null); // Pass null for res to avoid duplicate responses
                },
                statusCode === DisconnectReason.restartRequired ? 0 : parseInt(process.env.RECONNECT_INTERVAL ?? 5000) // Default 5s reconnect
            );
        }

        if (qr) { // Handle QR code
            if (res && !res.headersSent) {
                try {
                    const qrDataURL = await toDataURL(qr);
                    response(res, 200, true, 'QR code received, please scan the QR code.', { qr: qrDataURL });
                    console.log(`QR code generated for session ${sessionId}.`);
                    return;
                } catch (e) {
                    console.error(`Error generating QR code for session ${sessionId}:`, e);
                    response(res, 500, false, 'Unable to create QR code.');
                    try { await wa.logout(); } catch {}
                    deleteSession(sessionId, isLegacy);
                    return;
                }
            }
            // If response already sent, or no 'res' object, just log or handle internally
            console.log(`QR code for session ${sessionId}: ${qr}`);
            // You might want to send this QR to the client via another mechanism if 'res' is not available
        }
    })
}

const getSession = (sessionId) => {
    return sessions.get(sessionId) ?? null;
};

const deleteSession = (sessionId, isLegacy = false) => {
    const sessionFileBase = (isLegacy ? 'legacy_' : 'md_') + sessionId;
    const sessionDir = sessionsDir(sessionFileBase); // This is the directory for multi-file auth
    const storeFile = sessionsDir(`${sessionId}_store.json`); // The in-memory store file

    // Attempt to close the WhatsApp connection gracefully before deleting files
    const session = sessions.get(sessionId);
    if (session) {
        // Clear the periodic store save interval if it exists
        if (session.storeInterval) {
            clearInterval(session.storeInterval);
            console.log(`Cleared store interval for session ${sessionId}`);
        }

        if (session.ws && session.ws.readyState === session.ws.OPEN) {
            console.log(`Closing WebSocket for session ${sessionId} before deletion.`);
            try {
                session.logout(); // Attempt to log out gracefully
            } catch (e) {
                console.error(`Error logging out session ${sessionId}:`, e);
            }
        }
    }

    // Remove session directory for multi-file auth
    rmSync(sessionDir, { force: true, recursive: true });
    // Remove the in-memory store file
    rmSync(storeFile, { force: true, recursive: true });

    sessions.delete(sessionId);
    retries.delete(sessionId);

    setDeviceStatus(sessionId, 0);
    console.log(`Session files and data for ${sessionId} deleted.`);
};


const getChatList = (sessionId, isGroup = false) => {
    const filter = isGroup ? '@g.us' : '@s.whatsapp.net';

    const session = getSession(sessionId);
    if (!session || !session.store || !session.store.chats) {
        console.warn(`Store or chats not available for session ${sessionId}`);
        return [];
    }
    const allChats = session.store.chats.all();

    const filteredChats = allChats.filter((chat) => {
        return chat.id.endsWith(filter);
    });
    // Return sorted list for API requests as well
    return filteredChats.sort((a, b) => (b.conversationTimestamp || 0) - (a.conversationTimestamp || 0));
};

const isExists = async (session, jid, isGroup = false) => {
    try {
        let result;

        if (isGroup) {
            result = await session.groupMetadata(jid);
            return Boolean(result.id);
        } else {
            ;[result] = await session.onWhatsApp(jid);
        }

        return result?.exists || false;
    } catch(e) {
        console.error(`Error checking if JID exists (${jid}):`, e);
        return false;
    }
};

const sendMessage = async (session, receiver, message, delayMs = 1000) => {
    try {
        await delay(parseInt(delayMs));

        let messageContent = {};

        if (typeof message === 'string') {
            messageContent = { text: message };
        } else if (typeof message === 'object' && message !== null) {
            if (message.image) {
                messageContent = { image: message.image, caption: message.caption || '' };
            } else if (message.video) {
                messageContent = { video: message.video, caption: message.caption || '' };
            } else if (message.document) {
                messageContent = { document: message.document, fileName: message.fileName, mimetype: message.mimetype, caption: message.caption || '' };
            } else if (message.sticker) {
                messageContent = { sticker: message.sticker };
            }
            else if (message.text) {
                messageContent = { text: message.text };
            }
        } else {
            console.warn('Unsupported message format for sendMessage:', message);
            return Promise.reject(new Error('Unsupported message format'));
        }

        return session.sendMessage(receiver, messageContent);
    } catch (e) {
        console.error('Error sending message:', e);
        return Promise.reject(e);
    }
};

const formatPhone = (phone) => {
    if (phone.endsWith('@s.whatsapp.net')) {
        return phone;
    }

    let formatted = phone.replace(/\D/g, '');

    if (!formatted.startsWith('216') && formatted.length === 8) { // Assuming 8-digit Tunisian numbers without prefix
        formatted = '216' + formatted;
    }

    return (formatted += '@s.whatsapp.net');
};

const formatGroup = (group) => {
    if (group.endsWith('@g.us')) {
        return group;
    }

    let formatted = group.replace(/[^\d-]/g, '');

    return (formatted += '@g.us');
};

const cleanup = () => {
    console.log('Running cleanup before exit.');

    sessions.forEach((session, sessionId) => {
        if (!session.isLegacy) {
            if (session.store) {
                session.store.writeToFile(sessionsDir(`${sessionId}_store.json`));
            } else {
                console.warn(`No store found for session ${sessionId} during cleanup.`);
            }
        }
    });
};

const getContactsFromChatHistory = (sessionId) => {
    const session = getSession(sessionId);
    if (!session || !session.store || !session.store.contacts) {
        console.warn(`Store or contacts not available for session ${sessionId}`);
        return [];
    }

    const allContacts = session.store.contacts.all();
    console.log(`[DEBUG] getContactsFromChatHistory returning ${allContacts.length} contacts from store.contacts.`);
    return allContacts;
};

// Assuming sentWebHook is defined globally or passed somehow if needed by messages.upsert
// For a standalone module, it's better to pass it in or import it.
// For now, let's add a placeholder if it's not defined
async function sentWebHook(sessionId, data) {
    console.log(`[Webhook Placeholder] Sending data for session ${sessionId}:`, data);

        const webhookUrl = process.env.LARAVEL_WEBHOOK_URL;
        if (!webhookUrl) {
            console.error('LARAVEL_WEBHOOK_URL is not defined in environment variables.');
            return;
        }

        try {
            await axios.get(webhookUrl, data);
            console.log(`Webhook sent for session ${sessionId}:`, data.message);
        } catch (error) {
            console.error('Error sending webhook to Laravel:', error.message);
            if (error.response) {
                console.error('Laravel response status:', error.response.status);
                console.error('Laravel response data:', error.response.data);
            }
        }
}


const init = async (httpServer ) => { // Accept httpServer as argument
    // Attach WebSocket server to the HTTP server
    try {
        const files = await fs.readdir(sessionsDir());

        const sessionCreationPromises = [];
        for (const file of files) {
            // Updated logic to correctly identify session directories for multi-file auth
            // Multi-file auth stores credentials in a directory named after the session ID
            // The '_store.json' files are for the in-memory store's persistence, not the auth state
            if (file.startsWith('md_') || file.startsWith('legacy_')) { // Check for directory prefix
                 const sessionId = file.startsWith('md_') ? file.substring(3) : file.substring(7);
                 const sessionPath = sessionsDir(file); // This should be the directory, not a file

                 // Check if it's actually a directory for multi-file auth
                 const stats = await fs.stat(sessionPath);
                 if (stats.isDirectory()) {
                     console.log(`[INIT DEBUG] Scheduling session creation for: ${sessionId}, isLegacy: ${file.startsWith('legacy_')} from directory: ${file}`);
                     sessionCreationPromises.push(createSession(sessionId, file.startsWith('legacy_')));
                 } else {
                     console.log(`[INIT DEBUG] Skipping file/non-directory: ${file}`);
                 }
            } else {
                console.log(`[INIT DEBUG] Skipping file: ${file}`);
            }
        }
        await Promise.all(sessionCreationPromises);
        console.log(`[INIT DEBUG] Finished processing session files. Current in-memory sessions:`, Array.from(sessions.keys()));
    } catch (err) {
        if (err.code === 'ENOENT') {
            console.log('Sessions directory does not exist. Creating it.');
            try {
                await fs.mkdir(sessionsDir(), { recursive: true });
            } catch (mkdirErr) {
                console.error('Failed to create sessions directory:', mkdirErr);
                throw mkdirErr;
            }
            return;
        }
        throw err;
    }
};

export {
    isSessionExists,
    createSession,
    getSession,
    deleteSession,
    getChatList,
    isExists,
    sendMessage,
    formatPhone,
    formatGroup,
    cleanup,
    getContactsFromChatHistory,
    init
};