import { isSessionExists } from '../whatsapp.js'
import response from './../response.js'

const validate = (req, res, next) => {
    const sessionId = req.query.id ?? req.params.id
    console.log(`[SESSION VALIDATOR DEBUG] Checking session ID: "${sessionId}"`); // ADD THIS

    if (!isSessionExists(sessionId)) {
        console.log(`[SESSION VALIDATOR DEBUG] Session "${sessionId}" NOT found in in-memory map.`); // ADD THIS
        return response(res, 404, false, 'Session not found.')
    }

    res.locals.sessionId = sessionId
    console.log(`[SESSION VALIDATOR DEBUG] Session "${sessionId}" found. Proceeding.`); // ADD THIS

    next()
}

export default validate
