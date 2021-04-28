const router = require("express").Router();
const friends = require("../controller/friends.controller");

// MIDDLEWARE
const authenticate = require("../authentication");
router.use(authenticate);

// ----- Private ----- //

// GET /friends/requests Obté la llista d'usuaris que han enviat una petició d'amistat a l'usuari autenticat.
router.get("/requests", friends.);

// GET /friends Obté la llista d'usuaris que són amics amb l'usuari autenticat
router.get("/", friends.);

// POST /friends/ID Crea una petició d'amistat de l'usuari autenticat a l'usuari ID.
router.post("/:id", friends.);

// PUT /friends/ID Accepta la petició d'amistad de l'usuari ID (que ha rebut l'usuari autenticat)
router.put("/:id", friends.);

// DELETE /friends/ID Denega la petició d'amistad i/o (si ja són amics) l'esborra de la llista d'amics.
router.delete("/:id", friends.);

// ------------------- //

module.exports = router;