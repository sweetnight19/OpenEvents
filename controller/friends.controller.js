const { connection: conn } = require("../database/connection");

async function getFriendsRequest(req, res, next) {
    try {
        const [rows, fields] = await conn.promise().query("SELECT users.id,users.name,users.last_name,users.image,users.email FROM users INNER JOIN friends ON users.id=friends.user_id WHERE friends.status=0 AND friends.user_id_friend=?", [req.USER.id]);
        if (rows.length === 0) {
            return res.status(500).end();
        }
        return res.status(200).json(rows).end();
    } catch (ex) {
        return res.status(409).end();
    }
}
async function getFriends(req, res, next) {
    try {
        const [rows, fields] = await conn.promise().query("SELECT users.id,users.name,users.last_name,users.image,users.email FROM users INNER JOIN friends ON users.id=friends.user_id WHERE friends.status=1 AND friends.user_id_friend=?", [req.USER.id]);
        if (rows.length === 0) {
            return res.status(500).end();
        }
        return res.status(200).json(rows).end();
    } catch (ex) {
        return res.status(409).end();
    }
}
async function postFriendsRequest(req, res, next) {
    try {
        const [resultado] = await conn.promise().query("INSERT INTO `friends`(`user_id`, `user_id_friend`, `status`) VALUES (?,?,0)", [req.USER.id, req.params.id]);
        return res.status(204).end();
    } catch (ex) {
        return res.status(409).end();
    }
}

async function acceptFriendsRequest(req, res, next) {
    try {
        const [resultado] = await conn.promise().query("UPDATE `friends` SET `status`=1 WHERE `user_id`=? AND `user_id_friend`= ?", [req.params.id, req.USER.id]);
        return res.status(204).end();
    } catch (ex) {
        return res.status(409).end();
    }
}
async function deleteFriendsRequest(req, res, next) {
    try {
        const [resultado] = await conn.promise().query("DELETE FROM `friends` WHERE `user_id`=? AND `user_id_friend`=?", [req.params.id, req.USER.id]);
        return res.status(204).end();
    } catch (ex) {
        return res.status(409).end();
    }
}


module.exports = { getFriendsRequest, getFriends, postFriendsRequest, acceptFriendsRequest, deleteFriendsRequest };