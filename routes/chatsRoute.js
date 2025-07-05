import { Router } from 'express'
import { body, query } from 'express-validator'
import requestValidator from './../middlewares/requestValidator.js'
import sessionValidator from './../middlewares/sessionValidator.js'
import * as controller from './../controllers/chatsController.js'
import * as messagesController from './../controllers/messagesController.js'
import getMessages from './../controllers/getMessages.js'
import { getChatContacts } from './../controllers/contactsController.js';

const router = Router()

router.get('/', query('id').notEmpty(), requestValidator, sessionValidator, controller.getList)

router.get(
    '/contacts',
    query('id').notEmpty(),
    requestValidator,
    sessionValidator,
    getChatContacts
);
router.get(
    '/messages/:jid', // New route: /chats/messages/:jid
    query('id').notEmpty(),
    requestValidator,
    sessionValidator,
    messagesController.getMessages // Use the new controller
);
router.get('/:jid', query('id').notEmpty(), requestValidator, sessionValidator, getMessages)

router.post(
    '/send',
    query('id').notEmpty(),
    body('receiver').notEmpty(),
    body('message').notEmpty(),
    requestValidator,
    sessionValidator,
    controller.send
)

router.post('/send-bulk', query('id').notEmpty(), requestValidator, sessionValidator, controller.sendBulk)

export default router
