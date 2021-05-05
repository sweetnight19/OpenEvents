const { connection: sql } = require("../database/connection");

async function getByLogin(email) {
    let query = `SELECT * FROM users WHERE email= ?`;
    const [rows] = await sql.promise().query(query, [email]);
    console.log(rows[0]);
    return rows[0];
}

async function login(req, res, next) {
    try {
        let user;
        try {
            user = await getByLogin(req.body.email);
        } catch (ex) {
            res.status(404).json("Recurso no encontrado").end();
        }
        if (!user) {
            res.status(404).json("Recurso no encontrado").end();
        }
        const bcrypt = require("bcrypt");
        bcrypt.compare(req.body.password, user.password, (error, result) => {
            if (error) {
                res.status(404).json("Recurso no encontrado").end();

            }
            if (!result) {
                res.status(404).json("Recurso no encontrado").end();
            }
            const jwt = require("jsonwebtoken");
            const token = jwt.sign(
                JSON.stringify(user),
                process.env.ACCESS_TOKEN_SECRET
            );
            res.status(200).json({ "accessToken": token }).end();
        });
    } catch (error) {
        res.status(500).json("Recurso no encontrado").end();
    }
}

async function insert(user) {
    const [resultado] = await sql.promise().query("INSERT INTO users SET ?", user);
    user.id = resultado.insertId;
    return user;
}

async function addUser(req, res, next) {
    const bcrypt = require("bcrypt");
    const saltRounds = 10;
    const myPlaintextPassword = req.body.password;

    bcrypt.hash(myPlaintextPassword, saltRounds, async (err, hash) => {
        if (err) {
            res.status(500).json("Error al encriptar el password").end();
        }
        req.body.password = hash;
        try {
            const response = await insert(req.body);
            const user = {
                id: response.id,
                name: response.name,
                last_name: response.last_name,
                email: response.email,
                password: response.password,
            };
            res.status(201).json(user).end();
        } catch (ex) {
            res.status(409).json("Error al insertar el usuario").end();
        }
    });
}
async function getUsers(req, res, next) { }
async function getUsersByID(req, res, next) { }
async function searchUser(req, res, next) { }
async function changeInfoUser(req, res, next) { }
async function deleteUser(req, res, next) { }
async function searchUserEvents(req, res, next) { }


module.exports = { login, addUser, getUsers, getUsersByID, searchUser, changeInfoUser, deleteUser, searchUserEvents, getByLogin };