const router = require("express").Router();
const friends = require("../controller/friends.controller");

// MIDDLEWARE
const authenticate = require("../authentication");

// ----- Private ----- //

// GET /friends/requests Obté la llista d'usuaris que han enviat una petició d'amistat a l'usuari autenticat.
router.get("/requests", authenticate, friends.getFriendsRequest);

// GET /friends Obté la llista d'usuaris que són amics amb l'usuari autenticat
router.get("/", authenticate, friends.getFriends);

// POST /friends/ID Crea una petició d'amistat de l'usuari autenticat a l'usuari ID.
router.post("/:id", authenticate, friends.postFriendsRequest);

// PUT /friends/ID Accepta la petició d'amistad de l'usuari ID (que ha rebut l'usuari autenticat)
router.put("/:id", authenticate, friends.acceptFriendsRequest);

// DELETE /friends/ID Denega la petició d'amistad i/o (si ja són amics) l'esborra de la llista d'amics.
router.delete("/:id", authenticate, friends.deleteFriendsRequest);

// ------------------- //

module.exports = router;
