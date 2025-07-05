import { writeFileSync, readFileSync, existsSync } from 'fs';
import { join } from 'path';

const makeFileStore = (filepath) => {
    let data = {};

    console.log(`[FILE STORE DEBUG] Initializing store for filepath: ${filepath}`);

    if (existsSync(filepath)) {
        try {
            data = JSON.parse(readFileSync(filepath, 'utf-8'));
            console.log(`[FILE STORE DEBUG] Successfully read data from ${filepath}. Data keys:`, Object.keys(data));
            if (data.chats) {
                console.log(`[FILE STORE DEBUG] Chats loaded from file:`, Object.keys(data.chats).length, 'chats');
            }
        } catch (e) {
            console.error(`[FILE STORE ERROR] Error reading store file ${filepath}:`, e);
        }
    } else {
        console.log(`[FILE STORE DEBUG] File does not exist: ${filepath}. Starting with empty store.`);
    }

    const save = () => {
        try {
            writeFileSync(filepath, JSON.stringify(data, null, 2), 'utf-8');
            console.log(`[FILE STORE DEBUG] Data saved to ${filepath}. Chats count:`, Object.keys(data.chats || {}).length);
        } catch (e) {
            console.error(`[FILE STORE ERROR] Error writing store file ${filepath}:`, e);
        }
    };

    return {
        chats: {
            upsert: (newChats) => {
                newChats.forEach(chat => {
                    data.chats = data.chats || {};
                    // Preserve existing conversationTimestamp if it's newer, or if new chat doesn't have one
                    const existingChat = data.chats[chat.id];
                    if (existingChat && existingChat.conversationTimestamp && chat.conversationTimestamp && existingChat.conversationTimestamp > chat.conversationTimestamp) {
                        data.chats[chat.id] = { ...existingChat, ...chat, conversationTimestamp: existingChat.conversationTimestamp };
                    } else {
                        data.chats[chat.id] = { ...(existingChat || {}), ...chat };
                    }
                });
                console.log(`[FILE STORE DEBUG] Chats upserted. Current chats count:`, Object.keys(data.chats || {}).length);
                save();
            },
            all: () => {
                const all = Object.values(data.chats || {});
                console.log(`[FILE STORE DEBUG] chats.all() called. Returning ${all.length} chats.`);
                return all;
            }
        },
        messages: {
            upsert: (newMessages) => {
                newMessages.forEach(msg => {
                    data.messages = data.messages || {};
                    data.messages[msg.key.remoteJid] = data.messages[msg.key.remoteJid] || {};
                    data.messages[msg.key.remoteJid][msg.key.id] = { ...(data.messages[msg.key.remoteJid][msg.key.id] || {}), ...msg };

                    // --- ADDED/MODIFIED LOGIC TO UPDATE CHAT TIMESTAMP FROM MESSAGE ---
                    if (msg.key.remoteJid && msg.messageTimestamp) {
                        data.chats = data.chats || {};
                        const chatJid = msg.key.remoteJid;
                        let chat = data.chats[chatJid];

                        if (!chat) {
                            // If chat doesn't exist, create a basic entry for it
                            chat = {
                                id: chatJid,
                                name: msg.pushName || chatJid.split('@')[0], // Try to get pushName from message, or use JID
                                unreadCount: 0, // Will be updated by Baileys via chats.upsert
                                conversationTimestamp: msg.messageTimestamp
                            };
                            data.chats[chatJid] = chat;
                            console.log(`[FILE STORE DEBUG] Created new chat entry for ${chatJid} from message upsert.`);
                        } else {
                            // Only update if the new message's timestamp is newer
                            if (!chat.conversationTimestamp || msg.messageTimestamp > chat.conversationTimestamp) {
                                chat.conversationTimestamp = msg.messageTimestamp;
                                console.log(`[FILE STORE DEBUG] Updated chat ${chatJid} timestamp to ${msg.messageTimestamp}`);
                            }
                        }
                    }
                    // --- END ADDED/MODIFIED LOGIC ---
                });
                save();
            },
            get: (jid, id) => {
                const chatMessages = data.messages[jid];
                if (chatMessages && chatMessages[id]) {
                    return chatMessages[id]; // Return the full stored message object
                }
                return undefined;
            },
           all: () => {
                const allMsgs = [];
                for (const jid in data.messages) {
                    // Ensure data.messages[jid] is an object before iterating its properties
                    if (data.messages.hasOwnProperty(jid) && typeof data.messages[jid] === 'object' && data.messages[jid] !== null) {
                        for (const msgId in data.messages[jid]) {
                            // Ensure data.messages[jid][msgId] is a valid message object
                            const msg = data.messages[jid][msgId];
                            if (msg && msg.key && msg.key.remoteJid) { // Check for essential properties
                                allMsgs.push(msg);
                            } else {
                                console.warn(`[FILE STORE DEBUG] Skipping malformed message in store: ${JSON.stringify(msg)}`);
                            }
                        }
                    }
                }
                return allMsgs;
            }
        },
        contacts: {
            upsert: (newContacts) => {
                newContacts.forEach(contact => {
                    data.contacts = data.contacts || {};
                    data.contacts[contact.id] = { ...(data.contacts[contact.id] || {}), ...contact };
                });
                console.log(`[FILE STORE DEBUG] Contacts upserted. Current contacts count:`, Object.keys(data.contacts || {}).length);
                save();
            },
            all: () => Object.values(data.contacts || {})
        },
        bind: (ev) => {
            ev.on('chats.upsert', (newChats) => {
                newChats.forEach(chat => {
                    data.chats = data.chats || {};
                    const existingChat = data.chats[chat.id];
                    // Preserve existing conversationTimestamp if it's newer, or if new chat doesn't have one
                    if (existingChat && existingChat.conversationTimestamp && chat.conversationTimestamp && existingChat.conversationTimestamp > chat.conversationTimestamp) {
                        data.chats[chat.id] = { ...existingChat, ...chat, conversationTimestamp: existingChat.conversationTimestamp };
                    } else {
                        data.chats[chat.id] = { ...(existingChat || {}), ...chat };
                    }
                });
                console.log(`[FILE STORE DEBUG] Event 'chats.upsert' received. Current chats count:`, Object.keys(data.chats || {}).length);
                save();
            });
            ev.on('messages.upsert', (newMessages) => {
                newMessages.messages.forEach(msg => {
                    data.messages = data.messages || {};
                    data.messages[msg.key.remoteJid] = data.messages[msg.key.remoteJid] || {};
                    data.messages[msg.key.remoteJid][msg.key.id] = { ...(data.messages[msg.key.remoteJid][msg.key.id] || {}), ...msg };

                    // --- ADDED/MODIFIED LOGIC TO UPDATE CHAT TIMESTAMP FROM MESSAGE ---
                    if (msg.key.remoteJid && msg.messageTimestamp) {
                        data.chats = data.chats || {};
                        const chatJid = msg.key.remoteJid;
                        let chat = data.chats[chatJid];

                        if (!chat) {
                            // If chat doesn't exist, create a basic entry for it
                            chat = {
                                id: chatJid,
                                name: msg.pushName || chatJid.split('@')[0], // Try to get pushName from message, or use JID
                                unreadCount: 0, // Will be updated by Baileys via chats.upsert
                                conversationTimestamp: msg.messageTimestamp
                            };
                            data.chats[chatJid] = chat;
                            console.log(`[FILE STORE DEBUG] Created new chat entry for ${chatJid} from message upsert.`);
                        } else {
                            // Only update if the new message's timestamp is newer
                            if (!chat.conversationTimestamp || msg.messageTimestamp > chat.conversationTimestamp) {
                                chat.conversationTimestamp = msg.messageTimestamp;
                                console.log(`[FILE STORE DEBUG] Updated chat ${chatJid} timestamp to ${msg.messageTimestamp}`);
                            }
                        }
                    }
                    // --- END ADDED/MODIFIED LOGIC ---
                });
                save();
            });
            ev.on('contacts.upsert', (newContacts) => {
                newContacts.forEach(contact => {
                    data.contacts = data.contacts || {};
                    data.contacts[contact.id] = { ...(data.contacts[contact.id] || {}), ...contact };
                });
                console.log(`[FILE STORE DEBUG] Contacts upserted. Current contacts count:`, Object.keys(data.contacts || {}).length);
                save();
            });
        },
        readFromFile: (path) => {
            if (existsSync(path)) {
                try {
                    data = JSON.parse(readFileSync(path, 'utf-8'));
                    console.log(`[FILE STORE DEBUG] readFromFile called. Data keys:`, Object.keys(data));
                } catch (e) {
                    console.error(`[FILE STORE ERROR] Error reading store file ${path} in readFromFile:`, e);
                }
            }
        },
        writeToFile: (path) => {
            try {
                writeFileSync(path, JSON.stringify(data, null, 2), 'utf-8');
                console.log(`[FILE STORE DEBUG] writeToFile called. Data saved to ${path}. Chats count:`, Object.keys(data.chats || {}).length);
            } catch (e) {
                console.error(`[FILE STORE ERROR] Error writing store file ${path} in writeToFile:`, e);
            }
        }
    };
};

export { makeFileStore };
