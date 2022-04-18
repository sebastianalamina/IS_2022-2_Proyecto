const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const helmet = require("helmet");
const morgan = require("morgan");

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
app.use(morgan("short"));

app.use("/auth", require("./routes/auth.js"));
app.use("/menu",require("./routes/menu.js"))
app.use("/restaurant",require("./routes/restaurant.js"))


app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});


