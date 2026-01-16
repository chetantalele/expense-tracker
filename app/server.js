const express = require("express");
const app = express();

app.get("/", (_, res) => {
  res.send("🚀 Zero-Touch DevOps Platform Live");
});

app.get("/health", (_, res) => res.send("OK"));

app.listen(3000, () => console.log("Running on 3000"));
