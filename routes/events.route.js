const router = require("express").Router();
const events = require("../controller/events.controller");
const eventsPublic = require("../public/eventsBack");

// MIDDLEWARE
const authenticate = require("../authentication");
router.use(authenticate);

// ----- Public ----- //

// POST /event Crea un event associat a l'usuari autenticat.
router.post("/", eventsPublic.);

// GET /events Retorna tots el events
router.get("/", eventsPublic.);

// ------------------- //

// ----- Private ----- //

// GET /events/ID Retorna l'event amb l'IDRepresentació del recurs Descripció
router.get("/:id", events.);

// PUT /events/ID Modifica l'event autenticat
router.put("/:id", events.);

// DELETE /events/ID Esborra l'event ID
router.delete("/:id", events.);

// GET /events/ID/assistances Obté la llista d'asistents que asistiràn a l'event ID
router.get("/:id/assistances", events.);

// GET /events/ID/assistances/ID_USER Obté la assistència de l'ID_USER que asistirà a l'event ID
router.get("/:id/assistances/:id_user", events.);

// POST /events/ID/assistances Crea una assistència de l'usuari autenticat a l'event ID
router.post("/:id/assistances", events.);

// PUT /events/ID/assistances Crea la informació de assistència de l'usuari autenticat a l'event ID
router.put("/:id/assistances");

// DELETE /events/ID/assistances Esborra l'asistència de l'usuari autenticat a l'event ID
router.delete("/:id/assistances");

// ------------------- //

module.exports = router;