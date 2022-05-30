var pg = require("pg");
var fs = require("fs");
const dotenv = require("dotenv");
dotenv.config();

var pool = new pg.Pool({
  connectionString: process.env.DATABASE_URL,
});

pool.connect(function (err, client, done) {
  if (err) {
    console.log("error: ", err);
    process.exit(1);
  }
  client.query(
    "DROP DATABASE " + process.env.DB_NAME + " WITH (FORCE)",
    function (err, result) {
      if (err) {
        console.log("error: ", err);
        process.exit(1);
      }
      process.exit(0);
    }
  );
});
