// In contactsController.js
import { getContactsFromChatHistory, getSession, isSessionExists } from '../whatsapp.js';
import response from '../response.js';

const getChatContacts = (req, res, next) => { // Add 'next' parameter
    const { id: sessionId } = req.query;

    if (!isSessionExists(sessionId)) {
        return response(res, 404, false, 'Session not found.');
    }

    try {
        const contacts = getContactsFromChatHistory(sessionId);
        response(res, 200, true, 'Contacts retrieved successfully.', { contacts });
    } catch (e) {
        // Pass the error to the next error handling middleware
        next(e); // <--- CHANGE THIS LINE
    }
};

export { getChatContacts };
