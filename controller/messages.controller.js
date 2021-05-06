const { connection: conn } = require("../database/connection");

async function addMessage(req, res, next) {
    console.log("addmessage");
    if (req.body.content == undefined || req.body.user_id_send == undefined || req.body.user_id_recived == undefined) {
        return res.status(400).end();
    }
    const message = {
        content: req.body.content,
        user_id_send: req.body.user_id_send,
        user_id_recived: req.body.user_id_recived,
    };
    if (req.body.user_id_send !== req.USER.id) {
        return res.status(403).end();
    }
    try {
        const [resultado] = await conn.promise().query("INSERT INTO `message`(`content`, `user_id_send`, `user_id_recived`) VALUES (?,?,?)", [message.content, message.user_id_send, message.user_id_recived]);
        return res.status(204).end();
    } catch (ex) {
        return res.status(500).end();
    }
}
async function getMessage(req, res, next) {
    try {
        const [rows, fields] = await conn.promise().query("SELECT users.id,users.name,users.last_name,users.email FROM `users` INNER JOIN `message` ON users.id=message.user_id_send WHERE message.user_id_recived=?", [req.USER.id]);
        if (rows.length === 0) {
            return res.status(500).end();
        }
        return res.status(200).json(rows).end();
    } catch (ex) {
        return res.status(500).end();
    }
}
async function getMessagesById(req, res, next) {
    let userId = req.params.id;
    try {
        const [rows, fields] = await conn.promise().query("SELECT message.id,message.content,message.user_id_send,message.user_id_recived,message.timeStamp FROM `message` WHERE (user_id_send=2 AND user_id_recived= 103) OR (user_id_send=103 AND user_id_recived=2) ORDER BY message.id", [userId, req.USER.id, req.USER.id, userId]);
        if (rows.length === 0) {
            return res.status(500).end();
        }
        return res.status(200).json(rows).end();
    } catch (ex) {
        return res.status(500).end();
    }
}

module.exports = { addMessage, getMessage, getMessagesById };