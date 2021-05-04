const router = require("express").Router();
const users = require("../controller/users.controller");

// MIDDLEWARE
const authenticate = require("../authentication");
//router.use(authenticate);

// ----- Public ----- //

//POST /users/login
router.post("/login", users.login);

// POST /users Crea un usuari amb els següents parámetres
router.post("/", users.addUser);

// ------------------- //

// ----- Private ----- //

// GET /users Retorna tots el ususaris
router.get("/", authenticate, users.getUsers);

// GET /users/ID Retorna l'usuari amb l'ID
router.get("/:ID", authenticate, users.getUsersByID);

// GET /users/search Busca l'usuari que tingui el email, nom o cognom semblant al querystring s.
router.get("/search", authenticate, users.searchUser);

// PUT /users/ Modifica l'usuari autenticat
router.put("/", authenticate, users.changeInfoUser);

// DELETE /users
router.delete("/", authenticate, users.deleteUser);

// GET /users/ID/events Obté la llista d'events (que n'és propietari) l'usuari ID
router.get("/:ID/events",authenticate,users.searchUserEvents);

// ------------------- //

// GET /users/ID/events Obté la llista d'events (que n'és propietari) l'usuari ID
// GET /users/ID/events/future Obté la llista d'events (que n'és propietari) l'usuari ID que encara no han succeït
// GET /users/ID/events/finished Obté la llista d'events (que n'és propietari) l'usuari ID que ja han acabat
// GET /users/ID/events/current Obté la llista d'events (que n'és propietari) l'usuari ID que están succeint en aquest moment.
// GET /users/ID/assistances Obté la llista d'assistències a events per a l'usuari ID
// GET /users/ID/assistances/future Obté la llista d'assistències a events per a l'usuari ID que encara no han succeît
// GET /users/ID/assistances/finished Obté la llista d'assistències a events per a l'usuari ID que ja ha finalitzat
// GET /users/ID/friends Obté el llistat d'usuaris que són amics de l'usuari ID

module.exports = router;