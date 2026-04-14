const express = require("express");
const mongoose = require("mongoose");

const app = express();

// Mongo connection using ENV
mongoose.connect(
  `mongodb://${process.env.MONGO_INITDB_ROOT_USERNAME}:${process.env.MONGO_INITDB_ROOT_PASSWORD}@mongo:27017/admin`,
  { useNewUrlParser: true, useUnifiedTopology: true }
)
.then(() => console.log("MongoDB connected"))
.catch(err => console.log(err));

app.get("/api", (req, res) => {
  res.json({ message: "Hello from Node Backend" });
});

app.listen(5000, () => {
  console.log("Backend running on port 5000");
});
