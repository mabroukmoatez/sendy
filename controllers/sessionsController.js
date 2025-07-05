import { isSessionExists, createSession, getSession, deleteSession } from './../whatsapp.js'
import response from './../response.js'
import * as fs from 'fs'; // Still using callbacks for fs.readFile, will also provide async/await version


const find = (req, res) => {
    response(res, 200, true, 'Session found.')
}

const findorFail = (req, res) => {
    response(res, 200, true, 'Session found.')
}


const status = (req, res) => {
    const sessionId = res.locals.sessionId;
    const credsFilePath = `sessions/md_${sessionId}/creds.json`;
    const states = ['connecting', 'connected', 'disconnecting', 'disconnected'];

    // Check if session exists in memory first to prevent TypeError from getSession(undefined)
    if (!isSessionExists(sessionId)) {
        return response(res, 404, false, 'Session not found.', { status: 'not found', valid_session: false });
    }

    fs.readFile(credsFilePath, function(err, data) {
        let session = getSession(sessionId); // Get session here, after checking existence, and before potential file errors

        // Handle cases where getSession somehow returns null/undefined even after isSessionExists
        if (!session) {
             return response(res, 404, false, 'Session object not found in memory after file check.', { status: 'not found', valid_session: false });
        }

        let state = states[session.ws.readyState];
        state =
            state === 'connected' && typeof (session.isLegacy ? session.state.legacy.user : session.user) !== 'undefined'
                ? 'authenticated'
                : state;

        if (err) {
            // File read error (e.g., file not found, permissions)
            console.error(`Error reading creds.json for session ${sessionId}:`, err.message);
            response(res, 403, true, `Error reading session credentials: ${err.message}`, { status: state, valid_session: false });
        } else {
            // File read successfully, now attempt to parse
            try {
                let userdata = JSON.parse(data); // Use `data` (Buffer), not `rawdata`
                response(res, 200, true, '', { status: state, valid_session: true, userinfo: userdata.me });
            } catch (parseError) {
                // JSON parsing error
                console.error(`Error parsing creds.json for session ${sessionId}:`, parseError.message);
                response(res, 403, true, `Invalid session credentials file: ${parseError.message}`, { status: state, valid_session: false, userinfo: {} });
            }
        }
    });
}

// --- OR using async/await for better readability and modern Node.js practices ---

const statusAsync = async (req, res) => {
    const sessionId = res.locals.sessionId;
    const credsFilePath = `sessions/md_${sessionId}/creds.json`;
    const states = ['connecting', 'connected', 'disconnecting', 'disconnected'];

    if (!isSessionExists(sessionId)) {
        return response(res, 404, false, 'Session not found.', { status: 'not found', valid_session: false });
    }

    let session = getSession(sessionId);
    if (!session) {
        return response(res, 404, false, 'Session object not found in memory after check.', { status: 'not found', valid_session: false });
    }

    let state = states[session.ws.readyState];
    state =
        state === 'connected' && typeof (session.isLegacy ? session.state.legacy.user : session.user) !== 'undefined'
            ? 'authenticated'
            : state;

    try {
        const rawdata = await fs.promises.readFile(credsFilePath, 'utf-8');
        const userdata = JSON.parse(rawdata);
        response(res, 200, true, '', { status: state, valid_session: true, userinfo: userdata.me });
    } catch (e) {
        console.error(`Error processing creds.json for session ${sessionId}:`, e.message);
        // This catch block handles both readFile errors (e.g., file not found, permissions)
        // and JSON.parse errors (invalid JSON).
        response(res, 403, true, `Error fetching session credentials: ${e.message}`, { status: state, valid_session: false });
    }
}


const add = (req, res) => {
    const { id, isLegacy } = req.body

    if (isSessionExists(id)) {
        return response(res, 409, false, 'Session already exists, please use another id.')
    }

    // It's crucial that createSession handles its own errors or returns a Promise
    // that can be awaited/caught here if it involves async operations.
    // For now, assuming createSession handles its errors internally.
    createSession(id, isLegacy === 'true', res)
}

const del = async (req, res) => {
    const { id } = req.params
    const session = getSession(id)

    // Add a check here too to prevent calling logout on undefined
    if (!session) {
        return response(res, 404, false, 'Session not found for deletion.');
    }

    try {
        await session.logout()
    } catch (e) {
        console.warn(`Logout failed for session ${id}:`, e.message); // Log the error but continue
    } finally {
        deleteSession(id, session.isLegacy)
    }

    response(res, 200, true, 'The session has been successfully deleted.')
}


export { find, status, add, del }