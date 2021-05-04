const { connection: conn } = require("../database/connection");

async function getByLogin(email, password) {
    let query = "SELECT * FROM `users` WHERE `email`= ? AND `password`= ?";
    const [rows] = await conn.promise().query(query, [email, password]);
    return rows[0];
}

async function login(req, res, next) {
    console.log("login");
    try {
        try {
            const [resultado] = await conn.promise().query("SELECT * FROM `users` WHERE `email`= ? AND `password`= ?", [req.body.email, req.body.password]);
        } catch (ex) {
            return next({
                status: 500,
                error: "Error en la base de datos",
                trace: "ex",
            });
        }

        if (!resultado[0]) {
            return next({ status: 404, error: "El body no és correcte" });
        }


        console.log(`req.body.password: ${req.body.password}, user.password: ${user.password}`);
        /*
        bcrypt.compare(req.body.password, user.password, (error, result) => {
            if (error) {
                return next({ status: 401, error: "Recurso no encontrado" });
            }
            if (!result) {
                return next({ status: 404, error: "Recurso no encontrado" });
            }
            const jwt = require("jsonwebtoken");
            const token = jwt.sign(
                JSON.stringify(user),
                process.env.ACCESS_TOKEN_SECRET
            );
            res.json({ "accesToken": token });
        });
        */
        if (req.body.password == resultado.password) {
            const jwt = require("jsonwebtoken");
            const token = jwt.sign(
                JSON.stringify(user),
                process.env.ACCESS_TOKEN_SECRET
            );
            res.json({ "accesToken": token });
        } else {
            console.log("no son iguales");
        }
    } catch (error) {
        next({ status: 500, error: "Recurso no encontrado" });
    }
}
async function addUser(req, res, next) {
    console.log("addUser");
    const user2 = {
        name: req.body.name,
        last_name: req.body.last_name,
        email: req.body.email,
        password: req.body.password,
    };

    //console.log(user2);
    try {
        const [resultado] = await conn.promise().query("INSERT INTO `users` SET ?", user2);
        const user = {
            id: resultado.insertId,
            name: req.body.name,
            last_name: req.body.last_name,
            email: req.body.email,
            password: req.body.password,
        };
        return res.json({ status: 201, user });
    } catch (ex) {
        return next({ status: 409, error: "No s'ha pogut insertar correctament" });
    }
}
async function getUsers(req, res, next) { }
async function getUsersByID(req, res, next) { }
async function searchUser(req, res, next) { }
async function changeInfoUser(req, res, next) { }
async function deleteUser(req, res, next) { }
async function searchUserEvents(req, res, next) { }


module.exports = { login, addUser, getUsers, getUsersByID, searchUser, changeInfoUser, deleteUser, searchUserEvents, getByLogin };