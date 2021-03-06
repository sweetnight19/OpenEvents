const { connection: conn } = require("../database/connection");

async function addEvent(req, res) {
  if (
    req.body.name == undefined ||
    req.body.location == undefined ||
    req.body.description == undefined ||
    req.body.eventStart_date == undefined ||
    req.body.eventEnd_date == undefined ||
    req.body.n_participators == undefined ||
    req.body.type == undefined
  ) {
    return res.status(400).end();
  }
  try {
    const [resultado] = await conn
      .promise()
      .query(
        "INSERT INTO `events`(`name`, `owner_id`, `location`, `description`, `eventStart_date`, `eventEnd_date`, `n_participators`, `type`) VALUES (?,?,?,?,?,?,?,?)",
        [
          req.body.name,
          req.USER.id,
          req.body.location,
          req.body.description,
          req.body.eventStart_date,
          req.body.eventEnd_date,
          req.body.n_participators,
          req.body.type,
        ]
      );
    const event = {
      id: resultado.insertId,
      name: req.body.name,
      owner_id: req.USER.id,
      date: Date.now,
      location: req.body.location,
      description: req.body.description,
      eventStart_date: req.body.eventStart_date,
      eventEnd_date: req.body.eventEnd_date,
      n_participators: req.body.n_participators,
      type: req.body.type,
    };
    return res.status(204).json(event).end();
  } catch (ex) {
    return res.status(409).end();
  }
}

async function getEvents(req, res) {
  try {
    const [rows, fields] = await conn
      .promise()
      .query("SELECT * FROM `events` ORDER BY events.id");
    if (rows.length === 0) {
      return res.status(500).end();
    }
    return res.status(200).json(rows).end();
  } catch (ex) {
    return res.status(409).end();
  }
}

async function getEventsById(req, res) {
  try {
    const [rows, fields] = await conn
      .promise()
      .query("SELECT * FROM `events` WHERE `id`=?", [req.params.id]);
    if (rows.length === 0) {
      return res.status(500).end();
    }
    return res.status(200).json(rows[0]).end();
  } catch (ex) {
    return res.status(409).end();
  }
}

async function putEventsById(req, res) {
  if (
    req.body.name == undefined ||
    req.body.location == undefined ||
    req.body.description == undefined ||
    req.body.eventStart_date == undefined ||
    req.body.eventEnd_date == undefined ||
    req.body.n_participators == undefined ||
    req.body.type == undefined
  ) {
    return res.status(400).end();
  }
  try {
    const [rows, fields] = await conn
      .promise()
      .query("SELECT `owner_id` FROM `events` WHERE `id`=?", [req.params.id]);
    if (rows.length === 0) {
      return res.status(500).end();
    }
    if (rows[0].owner_id == req.USER.id) {
      try {
        const [rows, fields] = await conn
          .promise()
          .query(
            "UPDATE `events` SET `name`=?,`location`=?,`description`=?,`eventStart_date`=?,`eventEnd_date`=?,`n_participators`=?,`type`=? WHERE `id`=?",
            [
              req.body.name,
              req.body.location,
              req.body.description,
              req.body.eventStart_date,
              req.body.eventEnd_date,
              req.body.n_participators,
              req.body.type,
              req.params.id,
            ]
          );
        if (rows.length === 0) {
          return res.status(500).end();
        }
        return res.status(200).json(rows[0]).end();
      } catch (ex) {
        return res.status(409).end();
      }
    } else {
      return res.status(403).end();
    }
  } catch (ex) {
    return res.status(409).end();
  }
}

async function deleteEventsById(req, res) {
  try {
    const [rows, fields] = await conn
      .promise()
      .query("SELECT `owner_id` FROM `events` WHERE `id`=?", [req.params.id]);
    if (rows.length === 0) {
      return res.status(500).end();
    }
    if (rows[0].owner_id == req.USER.id) {
      try {
        const [rows, fields] = await conn
          .promise()
          .query("DELETE FROM `events` WHERE `id`=?", [req.params.id]);
        if (rows.length === 0) {
          return res.status(500).end();
        }
        return res.status(204).end();
      } catch (ex) {
        return res.status(409).end();
      }
    } else {
      return res.status(403).end();
    }
  } catch (ex) {
    return res.status(409).end();
  }
}

async function getListAssistancesEvents(req, res) {
  let rows = {};
  try {
    const [rows, fields] = await conn
      .promise()
      .query(
        "SELECT users.id, users.name, users.last_name,users.email,users.image,assistance.puntuation, assistance.comentary FROM users INNER JOIN assistance ON users.id =assistance.user_id WHERE assistance.event_id=?",
        [req.params.id]
      );
    return res.status(200).json(rows).end();
  } catch (ex) {
    return res.status(409).end();
  }
}

async function getListAssistancesUser(req, res) {
  try {
    const [rows, fields] = await conn
      .promise()
      .query(
        "SELECT users.id, users.name, users.last_name,users.email,users.image,assistance.puntuation, assistance.comentary FROM users INNER JOIN assistance ON users.id =assistance.user_id WHERE assistance.event_id=? AND users.id=?",
        [req.params.id, req.params.id_user]
      );
    if (rows.length === 0) {
      return res.status(500).end();
    }
    return res.status(200).json(rows[0]).end();
  } catch (ex) {
    return res.status(409).end();
  }
}

async function postAssistancesEvents(req, res) {
  if (
    req.body.puntuation == undefined ||
    req.body.comentary == undefined ||
    req.params.id == undefined
  ) {
    return res.status(400).end();
  }
  try {
    const [resultado] = await conn
      .promise()
      .query(
        "INSERT INTO `assistance`(`user_id`, `event_id`, `puntuation`, `comentary`) VALUES (?,?,?,?)",
        [req.USER.id, req.params.id, req.body.puntuation, req.body.comentary]
      );
    const event = {
      user_id: req.USER.id,
      event_id: req.params.id,
      puntuation: req.body.puntuation,
      comentary: req.body.comentary,
    };
    return res.status(201).json(event).end();
  } catch (ex) {
    return res.status(409).end();
  }
}

async function putInfoAssistanceEvent(req, res) {
  if (
    req.body.puntuation == undefined ||
    req.body.comentary == undefined ||
    req.params.id == undefined
  ) {
    return res.status(400).end();
  }
  try {
    const [resultado] = await conn
      .promise()
      .query(
        "UPDATE `assistance` SET `puntuation`=?,`comentary`=? WHERE `user_id`=? AND `event_id`=?",
        [req.body.puntuation, req.body.comentary, req.USER.id, req.params.id]
      );
    const event = {
      user_id: req.USER.id,
      event_id: req.params.id,
      puntuation: req.body.puntuation,
      comentary: req.body.comentary,
    };
    return res.status(201).json(event).end();
  } catch (ex) {
    return res.status(409).end();
  }
}

async function deleteAssistanceEvent(req, res) {
  try {
    const [rows, fields] = await conn
      .promise()
      .query("DELETE FROM `assistance` WHERE `user_id`=? AND `event_id`=?", [
        req.USER.id,
        req.params.id,
      ]);
    if (rows.length === 0) {
      return res.status(500).end();
    }
    return res.status(204).end();
  } catch (ex) {
    return res.status(409).end();
  }
}

module.exports = {
  addEvent,
  getEvents,
  getEventsById,
  putEventsById,
  deleteEventsById,
  getListAssistancesEvents,
  postAssistancesEvents,
  putInfoAssistanceEvent,
  deleteAssistanceEvent,
  getListAssistancesUser,
};
