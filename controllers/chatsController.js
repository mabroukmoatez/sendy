// controllers/chatsController.js
import { getSession, getChatList, isExists, sendMessage, formatPhone, formatGroup } from './../whatsapp.js' // Added formatGroup
import response from './../response.js'
import WebSocket from 'ws' // <-- NEW: Import WebSocket for checking client state

const getList = (req, res) => {
    return response(res, 200, true, '', getChatList(res.locals.sessionId))
}

const send = async (req, res) => {
    const sessionId = res.locals.sessionId // Get session ID from res.locals
    const session = getSession(sessionId) // Get the Baileys session
    const receiver = req.body.receiver // Use the raw receiver from the request body
    const delay = req.body.delay
    const { message } = req.body

    if (!session) {
        return response(res, 404, false, 'Device session not found or not connected.')
    }

    let receiverJid;
    // Determine if it's a group or individual chat based on the format
    if (receiver.includes('@g.us')) {
        receiverJid = formatGroup(receiver); // Format for group JID
    } else {
        receiverJid = formatPhone(receiver); // Format for individual JID
    }

    try {
        const exists = await isExists(session, receiverJid) // Use receiverJid here

        if (!exists) {
            return response(res, 400, false, 'The receiver number/group is not valid or does not exist.')
        }

        // Send the message using your whatsapp.js's sendMessage function
        // sendMessage should return the full message object from Baileys.
        const sentMsg = await sendMessage(session, receiverJid, message, delay); // Pass receiverJid

        // --- NEW: Immediately send WebSocket update for the sent message ---
        // Ensure the session object has the wsClient attached (from whatsapp.js init)
        if (session.wsClient && session.wsClient.readyState === WebSocket.OPEN) {
            // Construct the payload in the format expected by your client-side appendMessage function.
            const payload = {
                key: {
                    remoteJid: sentMsg.key.remoteJid,
                    fromMe: true, // This is crucial for outgoing messages
                    id: sentMsg.key.id
                },
                message: sentMsg.message, // The actual message content (e.g., { conversation: 'Your message' })
                messageTimestamp: sentMsg.messageTimestamp // Timestamp from the sent message
            };

            session.wsClient.send(JSON.stringify({ type: 'message_update', payload: payload }));
            console.log(`[WS] Sent real-time 'message_update' for outgoing message to client ${sessionId}.`);
        } else {
            console.warn(`[WS] No active WebSocket client found for session ${sessionId} to send real-time update for outgoing message.`);
        }
        // --- END NEW ---

        response(res, 200, true, 'The message has been successfully sent.', sentMsg) // Optionally, return sentMsg data
    } catch (error) { // Catch the actual error object
        console.error('Failed to send the message:', error); // Log the full error
        response(res, 500, false, 'Failed to send the message. ' + error.message) // Provide error message
    }
}

const sendBulk = async (req, res) => {
    const session = getSession(res.locals.sessionId)
    const errors = []

    if (!session) {
        return response(res, 404, false, 'Device session not found or not connected.')
    }

    for (const [key, data] of req.body.entries()) {
        let { receiver, message, delay } = data

        if (!receiver || !message) {
            errors.push(key)
            continue
        }

        if (!delay || isNaN(delay)) {
            delay = 1000
        }

        let receiverJid;
        if (receiver.includes('@g.us')) {
            receiverJid = formatGroup(receiver);
        } else {
            receiverJid = formatPhone(receiver);
        }

        try {
            const exists = await isExists(session, receiverJid)

            if (!exists) {
                errors.push(key)
                continue
            }

            // For bulk send, you might not want to send individual WS updates for each message
            // or you might want to send a single 'bulk_send_complete' update.
            // For now, we're only adding it to the single `send` function.
            await sendMessage(session, receiverJid, message, delay)
        } catch (error) { // Catch actual error
            console.error(`Error sending bulk message for key ${key}:`, error);
            errors.push(key)
        }
    }

    if (errors.length === 0) {
        return response(res, 200, true, 'All messages have been successfully sent.')
    }

    const isAllFailed = errors.length === req.body.length

    response(
        res,
        isAllFailed ? 500 : 200,
        !isAllFailed,
        isAllFailed ? 'Failed to send all messages.' : 'Some messages have been successfully sent.',
        { errors }
    )
}

export { getList, send, sendBulk }