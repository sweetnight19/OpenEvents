const router = require("express").Router();
const events = require("../controller/events.controller");

// MIDDLEWARE
const authenticate = require("../authentication");

// ----- Public ----- //

// GET /events Retorna tots el events
router.get("/", events.getEvents);

// GET /events/ID Retorna l'event amb l'IDRepresentació del recurs Descripció
router.get("/:id", authenticate, events.getEventsById);

// ------------------- //

// ----- Private ----- //

// POST /event Crea un event associat a l'usuari autenticat.
router.post("/", authenticate, events.addEvent);

// PUT /events/ID Modifica l'event autenticat
router.put("/:id", authenticate, events.putEventsById);

// DELETE /events/ID Esborra l'event ID
router.delete("/:id", authenticate, events.deleteEventsById);

// GET /events/ID/assistances Obté la llista d'asistents que asistiràn a l'event ID
router.get("/:id/assistances", authenticate, events.getListAssistancesEvents);

//------ GET /events/ID/assistances/ID_USER Obté la assistència de l'ID_USER que asistirà a l'event ID
router.get("/:id/assistances/:id_user", events.getListAssistancesUser);

// POST /events/ID/assistances Crea una assistència de l'usuari autenticat a l'event ID
router.post("/:id/assistances", authenticate, events.postAssistancesEvents);

// PUT /events/ID/assistances Crea la informació de assistència de l'usuari autenticat a l'event ID
router.put("/:id/assistances", authenticate, events.putInfoAssistanceEvent);

// DELETE /events/ID/assistances Esborra l'asistència de l'usuari autenticat a l'event ID
router.delete("/:id/assistances", authenticate, events.deleteAssistanceEvent);

// ------------------- //

module.exports = router;
