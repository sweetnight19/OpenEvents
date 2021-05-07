const { connection: conn } = require("../database/connection");

async function getFriendsRequest(req, res) {
    let rows = {};
    try {
        const [rows1, fields] = await conn.promise().query("SELECT DISTINCT(users.id),users.name,users.last_name,users.image,users.email FROM users INNER JOIN friends ON users.id=friends.user_id WHERE friends.status=0 AND friends.user_id_friend=? ORDER BY users.id", [req.USER.id]);
        try {
            const [rows2, fields] = await conn.promise().query("SELECT DISTINCT(users.id),users.name,users.last_name,users.image,users.email FROM users INNER JOIN friends ON users.id=friends.user_id_friend WHERE friends.status=0 AND friends.user_id=? ORDER BY users.id", [req.USER.id]);
            if (rows1.length === 0 && rows2.length === 0) {
                return res.status(500).end();
            }
            console.log(rows1);
            console.log(rows2);
            if (rows1.length === 0) {
                return res.status(200).json(rows2).end();
            }
            if (rows2.length === 0) {
                return res.status(200).json(rows1).end();
            }

            rows.rows1 = rows1;
            rows.rows2 = rows2;
            return res.status(200).json(rows).end();
        } catch (ex) {
            return res.status(409).end();
        }
    } catch (ex) {
        return res.status(409).end();
    }
}
async function getFriends(req, res) {
    let rows = {};

    try {
        const [rows1, fields] = await conn.promise().query("SELECT users.id,users.name,users.last_name,users.image,users.email FROM users INNER JOIN friends ON users.id=friends.user_id WHERE friends.status=1 AND friends.user_id_friend=? ORDER BY users.id", [req.USER.id]);
        if (rows.length === 0) {
            return res.status(500).end();
        }
        try {
            const [rows2, fields] = await conn.promise().query("SELECT users.id,users.name,users.last_name,users.image,users.email FROM users INNER JOIN friends ON users.id=friends.user_id_friend WHERE friends.status=1 AND friends.user_id=? ORDER BY users.id", [req.USER.id]);
            if (rows1.length === 0 && rows2.length === 0) {
                return res.status(500).end();
            }
            if (rows1.length === 0) {
                return res.status(200).json(rows2).end();
            }
            if (rows2.length === 0) {
                return res.status(200).json(rows1).end();
            }
            rows.rows1 = rows1;
            rows.rows2 = rows2;
            return res.status(200).json(rows).end();
        } catch (ex) {
            return res.status(409).end();
        }
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