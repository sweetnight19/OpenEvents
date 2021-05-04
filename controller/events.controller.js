const { connection: conn } = require("../database/connection");

async function addEvent(req, res, next) { }
async function getEvents(req, res, next) { }
async function getEventsById(req, res, next) { }
async function putEventsById(req, res, next) { }
async function deleteEventsById(req, res, next) { }
async function getListAssistancesEvents(req, res, bext) { }
async function postAssistancesEvents(req, res, bext) { }
async function putInfoAssistanceEvent(req, res, next) { }
async function deleteAssistanceEvent(req, res, next) { }

module.exports = { addEvent, getEvents, getEventsById, putEventsById, deleteEventsById, getListAssistancesEvents, postAssistancesEvents, putInfoAssistanceEvent, deleteAssistanceEvent };