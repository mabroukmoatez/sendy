import 'dotenv/config'
import express from 'express'
import nodeCleanup from 'node-cleanup'
import routes from './routes.js'
import { init, cleanup } from './whatsapp.js'
import cors from 'cors'
import http from 'http'; // Import http module

const app = express( )

// >>>>>> THIS IS THE CRUCIAL DEBUGGING LINE <<<<<<
app.use((req, res, next) => {
    console.log(`[APP.JS DEBUG] Request received: ${req.method} ${req.originalUrl}`);
    next();
});
// >>>>>> END OF DEBUGGING LINE <<<<<<

const host = process.env.WA_SERVER_HOST || undefined
const port = parseInt(process.env.WA_SERVER_PORT ?? 8000)

app.use(cors())
app.use(express.urlencoded({ extended: true }))
app.use(express.json())
app.use('/', routes)

// Create HTTP server explicitly
const httpServer = http.createServer(app );

const listenerCallback = () => {
    init(httpServer ); // Pass the httpServer to init( )
    console.log(`Server is listening on http://${host ? host : 'localhost'}:${port}` );
}

if (host) {
    httpServer.listen(port, host, listenerCallback ); // Listen with httpServer
} else {
    httpServer.listen(port, listenerCallback ); // Listen with httpServer
}

nodeCleanup(cleanup )

export default app
