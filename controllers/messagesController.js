// In /var/www/html/controllers/messagesController.js

import { getSession } from '../whatsapp.js';
import response from '../response.js';

const getMessages = (req, res) => {
    const { jid } = req.params;
    const { sessionId } = res.locals;

    const session = getSession(sessionId);
    if (!session || !session.store || !session.store.messages) {
        return response(res, 404, false, 'Session or message store not found.');
    }

    try {
        // --- MODIFIED: Add defensive checks in filter ---
        const messages = session.store.messages.all().filter(msg => msg && msg.key && msg.key.remoteJid === jid);
        // --- END MODIFIED ---
        // Sort these messages by messageTimestamp
        messages.sort((a, b) => {
            let tsA = a.messageTimestamp;
            let tsB = b.messageTimestamp;
            if (typeof tsA === 'object' && tsA !== null && 'low' in tsA) tsA = tsA.low;
            if (typeof tsB === 'object' && tsB !== null && 'low' in tsB) tsB = tsB.low;
            return (tsA || 0) - (tsB || 0); // Ascending order for chat display
        });

        const processedMessages = messages.map(msg => {
            let timestamp = msg.messageTimestamp;
            if (typeof timestamp === 'object' && timestamp !== null && 'low' in timestamp) {
                timestamp = timestamp.low;
            }
            return {
                ...msg,
                messageTimestamp: timestamp
            };
        });

        return response(res, 200, true, 'Messages retrieved successfully.', { messages: processedMessages });
    } catch (e) {
        console.error('Error retrieving messages for JID:', jid, e);
        return response(res, 500, false, 'Failed to retrieve messages.');
    }
};

export { getMessages };
