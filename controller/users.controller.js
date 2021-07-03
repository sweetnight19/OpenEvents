const { connection: sql } = require("../database/connection");

async function getByLogin(email) {
  let query = `SELECT * FROM users WHERE email= ?`;
  const [rows] = await sql.promise().query(query, [email]);
  return rows[0];
}

async function login(req, res) {
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
      res.status(200).json({ accessToken: token });
    });
  } catch (error) {
    res.status(500).json("Recurso no encontrado").end();
  }
}

async function insert(user) {
  const [resultado] = await sql
    .promise()
    .query("INSERT INTO users SET ?", user);
  user.id = resultado.insertId;
  return user;
}

async function addUser(req, res) {
  const bcrypt = require("bcrypt");
  const saltRounds = 10;
  const myPlaintextPassword = req.body.password;
  const origianlPassword = req.body.password;

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
        image: "NULL",
        password: origianlPassword,
      };
      res.status(201).json(user).end();
    } catch (ex) {
      res.status(409).json("Error al insertar el usuario").end();
    }
  });
}

async function getUsers(req, res) {
  try {
    const [rows, fields] = await sql
      .promise()
      .query(
        "SELECT `id`,`name`,`last_name`,`image`,`email` FROM `users` ORDER BY `id`"
      );
    if (rows.length === 0) {
      return res.status(500).end();
    }
    return res.status(200).json(rows).end();
  } catch (ex) {
    return res.status(409).end();
  }
}

async function getUsersByID(req, res) {
  try {
    const [rows, fields] = await sql
      .promise()
      .query(
        "SELECT `id`,`name`,`last_name`,`image`,`email` FROM `users` WHERE `id`=?",
        [req.params.id]
      );
    if (rows.length === 0) {
      return res.status(500).end();
    }
    return res.status(200).json(rows[0]).end();
  } catch (ex) {
    return res.status(409).end();
  }
}

async function searchUser(req, res) {
  try {
    const [rows] = await sql
      .promise()
      .query(
        "SELECT `id`,`name`, `last_name`, `image`,`email` FROM `users` WHERE `name`= ?",
        [req.query.s]
      );
    if (rows.length === 0) {
      return res.status(500).end();
    }
    return res.status(200).json(rows[0]).end();
  } catch (ex) {
    return res.status(409).end();
  }
}

async function changeInfoUser(req, res) {
  if (
    req.body.name == undefined ||
    req.body.last_name == undefined ||
    req.body.email == undefined ||
    req.body.password == undefined
  ) {
    return res.status(400).end();
  }

  const bcrypt = require("bcrypt");
  const saltRounds = 10;
  const myPlaintextPassword = req.body.password;

  bcrypt.hash(myPlaintextPassword, saltRounds, async (err, hash) => {
    if (err) {
      res.status(500).json().end();
    }
    req.body.password = hash;
    try {
      const [resultado] = await sql
        .promise()
        .query(
          "UPDATE `users` SET `name`=?,`last_name`=?,`email`=?,`password`=? WHERE `id`=?",
          [
            req.body.name,
            req.body.last_name,
            req.body.email,
            req.body.password,
            req.USER.id,
          ]
        );
      if (resultado.length === 0) {
        return res.status(500).end();
      }
      let user = {
        id: req.USER.id,
        name: req.body.name,
        last_name: req.body.last_name,
        email: req.body.email,
      };
      return res.status(200).json(user).end();
    } catch (ex) {
      return res.status(409).end();
    }
  });
}

async function deleteUser(req, res) {
  try {
    const [rows, fields] = await sql
      .promise()
      .query("DELETE FROM `users` WHERE `id`=?", [req.USER.id]);
    if (rows.length === 0) {
      return res.status(500).end();
    }
    return res.status(204).end();
  } catch (ex) {
    return res.status(409).end();
  }
}

async function getListAssistancesEvents(req, res) {
  try {
    const [rows, fields] = await sql
      .promise()
      .query(
        "SELECT events.* FROM `events` INNER JOIN users ON events.owner_id=users.id WHERE users.id=?",
        [req.params.id]
      );
    return res.status(200).json(rows).end();
  } catch (ex) {
    return res.status(409).end();
  }
}

async function getListAssistancesEventsFuture(req, res) {
  try {
    const [rows, fields] = await sql
      .promise()
      .query(
        "SELECT events.* FROM `events` INNER JOIN users ON events.owner_id=users.id WHERE users.id=19 AND events.eventStart_date>CURRENT_TIMESTAMP",
        [req.params.id]
      );
    return res.status(200).json(rows).end();
  } catch (ex) {
    return res.status(409).end();
  }
}

async function getListAssistancesEventsPast(req, res) {
  try {
    const [rows, fields] = await sql
      .promise()
      .query(
        "SELECT events.* FROM `events` INNER JOIN users ON events.owner_id=users.id WHERE users.id=19 AND events.eventEnd_date<CURRENT_TIMESTAMP",
        [req.params.id]
      );
    return res.status(200).json(rows).end();
  } catch (ex) {
    return res.status(409).end();
  }
}

async function getListAssistancesEventsCurrent(req, res) {
  try {
    const [rows, fields] = await sql
      .promise()
      .query(
        "SELECT events.* FROM `events` INNER JOIN users ON events.owner_id=users.id WHERE users.id=19 AND events.eventStart_date<CURRENT_TIMESTAMP AND events.eventEnd_date>CURRENT_TIMESTAMP",
        [req.params.id]
      );
    return res.status(200).json(rows).end();
  } catch (ex) {
    return res.status(409).end();
  }
}

async function getListAssistances(req, res) {
  try {
    const [rows, fields] = await sql
      .promise()
      .query(
        "SELECT events.*, assistance.comentary,assistance.puntuation FROM events INNER JOIN assistance ON assistance.event_id=events.id WHERE assistance.user_id=?",
        [req.params.id]
      );
    return res.status(200).json(rows).end();
  } catch (ex) {
    return res.status(409).end();
  }
}

async function getListAssistancesFuture(req, res) {
  try {
    const [rows, fields] = await sql
      .promise()
      .query(
        "SELECT events.*, assistance.comentary,assistance.puntuation FROM events INNER JOIN assistance ON assistance.event_id=events.id WHERE assistance.user_id=? AND CURRENT_TIMESTAMP< events.eventStart_date",
        [req.params.id]
      );
    return res.status(200).json(rows).end();
  } catch (ex) {
    return res.status(409).end();
  }
}

async function getListAssistancesFinished(req, res) {
  try {
    const [rows, fields] = await sql
      .promise()
      .query(
        "SELECT events.*, assistance.comentary,assistance.puntuation FROM events INNER JOIN assistance ON assistance.event_id=events.id WHERE assistance.user_id=? AND CURRENT_TIMESTAMP > events.eventEnd_date",
        [req.params.id]
      );
    return res.status(200).json(rows).end();
  } catch (ex) {
    return res.status(409).end();
  }
}

async function getFriends(req, res) {
  let rows = {};

  try {
    const [rows1, fields] = await sql
      .promise()
      .query(
        "SELECT users.id,users.name,users.last_name,users.image,users.email FROM users INNER JOIN friends ON users.id=friends.user_id WHERE friends.status=1 AND friends.user_id_friend=? ORDER BY users.id",
        [req.params.id]
      );
    try {
      const [rows2, fields] = await sql
        .promise()
        .query(
          "SELECT users.id,users.name,users.last_name,users.image,users.email FROM users INNER JOIN friends ON users.id=friends.user_id_friend WHERE friends.status=1 AND friends.user_id=? ORDER BY users.id",
          [req.params.id]
        );
      if (rows1.length === 0 && rows2.length === 0) {
        return res.status(200).json(rows).end();
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

module.exports = {
  login,
  addUser,
  getUsers,
  getUsersByID,
  searchUser,
  changeInfoUser,
  deleteUser,
  getByLogin,
  getListAssistancesEvents,
  getListAssistancesEventsFuture,
  getListAssistancesEventsPast,
  getListAssistancesEventsCurrent,
  getListAssistances,
  getListAssistancesFuture,
  getListAssistancesFinished,
  getFriends,
};
