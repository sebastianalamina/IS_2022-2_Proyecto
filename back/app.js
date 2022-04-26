const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const helmet = require("helmet");
const morgan = require("morgan");

const { bearerAuth } = require("./utils/middleware/auth");

const app = express();
const port = 3001;

// definición de BigInt toJSON, para que no falle con base de datos.
BigInt.prototype["toJSON"] = function () {
  return this.toString();
};

app.use(bodyParser.urlencoded({ limit: "10mb", extended: true }));
app.use(bodyParser.json({ limit: "10mb", extended: true }));
app.use(cors());
app.use(helmet());

<<<<<<< HEAD
app.use("/auth", require("./routes/auth.js"));
app.use("/menu",require("./routes/menu.js"))
app.use("/restaurant",require("./routes/restaurant.js"))
=======
app.use(
  morgan(":method :rol :url :status - :response-time ms", {
    skip: (req, res) => process.env.NODE_ENV === "test",
  })
);
morgan.token("rol", function (req, res) {
  if (!req.authenticated) return "visitante";
  return req.user.rol;
});
>>>>>>> origin/main

app.use(bearerAuth);
app.use("/auth", require("./routes/auth.js"));
app.use("/menu", require("./routes/menu.js"));
app.use("/inventario", require("./routes/inventario.js"));
app.use("/estado-platillo", require("./routes/estado-platillo.js"));
app.use("/empleado", require("./routes/empleado.js"));
app.use("/restaurante", require("./routes/restaruante.js"));

app.get("/", (req, res) => {
  res.send("Hello World!");
});

const isEntryPoint = require.main === module;

if (isEntryPoint)
  app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
  });
else module.exports = app;
