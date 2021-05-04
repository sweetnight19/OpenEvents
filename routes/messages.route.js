const router = require("express").Router();
const messages = require("../controller/messages.controller");

// MIDDLEWARE
const authenticate = require("../authentication");
router.use(authenticate);

// ----- Private ----- //

// POST /messages Crea un missatge
router.post("/", authenticate, messages.addMessage);

// GET /messages/users Obté tots els usuaris que han enviat algún missatge a l'usuari autenticat.
router.get("/users", authenticate, messages.getMessage);

// GET /messages/USER_ID Obté tots els missatges de l'USER_ID a l'usuari autenticat.
router.get("/:id", authenticate, messages.getMessagesById);

// ------------------- //

module.exports = router;
