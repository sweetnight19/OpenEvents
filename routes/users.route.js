const router = require("express").Router();
const users = require("../controller/users.controller");

// MIDDLEWARE
const authenticate = require("../authentication");

// ----- Public ----- //

//POST /users/login
router.post("/login", users.login);

// POST /users Crea un usuari amb els següents parámetres
router.post("/", users.addUser);

// ------------------- //

// ----- Private ----- //

// GET /users Retorna tots el ususaris
router.get("/", authenticate, users.getUsers);

// GET /users/search Busca l'usuari que tingui el email, nom o cognom semblant al querystring s.
router.get("/search", authenticate, users.searchUser);

// GET /users/ID Retorna l'usuari amb l'ID
router.get("/:id", authenticate, users.getUsersByID);

// PUT /users/ Modifica l'usuari autenticat
router.put("/", authenticate, users.changeInfoUser);

// DELETE /users
router.delete("/", authenticate, users.deleteUser);

// GET /users/ID/events Obté la llista d'events (que n'és propietari) l'usuari ID
router.get("/:id/events", authenticate, users.getListAssistancesEvents);

// GET /users/ID/events/future Obté la llista d'events (que n'és propietari) l'usuari ID que encara no han succeït
router.get(
  "/:id/events/future",
  authenticate,
  users.getListAssistancesEventsFuture
);

// GET /users/ID/events/finished Obté la llista d'events (que n'és propietari) l'usuari ID que ja han acabat
router.get(
  "/:id/events/finished",
  authenticate,
  users.getListAssistancesEventsPast
);

// GET /users/ID/events/current Obté la llista d'events (que n'és propietari) l'usuari ID que están succeint en aquest moment.
router.get(
  "/:id/events/current",
  authenticate,
  users.getListAssistancesEventsCurrent
);

// GET /users/ID/assistances Obté la llista d'assistències a events per a l'usuari ID
router.get("/:id/assistances", authenticate, users.getListAssistances);

// GET /users/ID/assistances/future Obté la llista d'assistències a events per a l'usuari ID que encara no han succeît
router.get(
  "/:id/assistances/future",
  authenticate,
  users.getListAssistancesFuture
);

// GET /users/ID/assistances/finished Obté la llista d'assistències a events per a l'usuari ID que ja ha finalitzat
router.get(
  "/:id/assistances/finished",
  authenticate,
  users.getListAssistancesFinished
);

// GET /users/ID/friends Obté el llistat d'usuaris que són amics de l'usuari ID
router.get("/:id/friends", authenticate, users.getFriends);

// ------------------- //

module.exports = router;
