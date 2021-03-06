require("dotenv").config();
const express = require("express");
const app = express();
const port = process.env.PORT || 3000;

// ROUTES
const users = require("./routes/users.route");
const events = require("./routes/events.route");
const friends = require("./routes/friends.route");
const messages = require("./routes/messages.route");

app.use(express.json());
app.use("/api/users", users);
app.use("/api/events", events);
app.use("/api/friends", friends);
app.use("/api/messages", messages);
app.get("/", (req, res) =>
  res.send("Welcome to OpenEvents Api by David Marquet!").end()
);

//FALLBACK PUBLIC
app.all("*", (req, res, next) => {
  console.log(req.url);
  next({
    status: 404,
    error: "Not found",
  });
});
/*
app.use((err, req, res, next) => {
  res.status(err.status).json(err);
});
*/

app.listen(port, () => {
  console.log(`http://localhost:${port}`);
});
