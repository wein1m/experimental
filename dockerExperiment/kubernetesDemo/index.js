import express from "express";

const app = express();
const PORT = 3000;

app.get("/", (req, res) => {
  res.json({
    message: "Hii~ I'm a Container~",
    service: "from node~",
    pod: process.env.POD_NAME || "unknown",
    time: new Date().toISOString(),
  });
});

app.get("/readyz", (req, res) => res.status(200).send("ready!!"));
app.get("/healthz", (req, res) => res.status(200).send("health bar: 100!!!!"));

app.listen(PORT, () => {
  console.log(`App is running on http://localhost:${PORT}`);
});
