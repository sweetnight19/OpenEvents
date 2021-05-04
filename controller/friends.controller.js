const { connection: conn } = require("../database/connection");

async function getFriendsRequest(req, res, next) { }
async function getFriends(req, res, next) { }
async function postFriendsRequest(req, res, next) { }
async function acceptFriendsRequest(req, res, next) { }
async function deleteFriendsRequest(req, res, next) { }


module.exports = { getFriendsRequest, getFriends, postFriendsRequest, acceptFriendsRequest, deleteFriendsRequest };