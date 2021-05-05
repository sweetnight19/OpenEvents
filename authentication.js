const jwt = require('jsonwebtoken');

function authenticate(req, response, next) {
  const authHeader = req.header("Authorization");
  const token = authHeader && authHeader.split(" ")[1];

  if (token == null) {
    response.status(401).end();
  }
  jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, function (err, user) {
    if (err) {
      return response.status(401).end();
    }
    req.USER = user;
    next();
  });
}

module.exports = authenticate;