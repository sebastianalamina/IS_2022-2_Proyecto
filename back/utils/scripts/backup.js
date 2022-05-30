const { PostgreSql } = require("@shagital/db-dumper");
const dotenv = require("dotenv");
dotenv.config();

//

PostgreSql.create()
  .setDbName(process.env.DB_NAME)
  .setUserName(process.env.DB_USER)
  .setPassword(process.env.PGPASS)
  .addExtraOption("--column-inserts")
  .addExtraOption("--data-only")
  .dumpToFile("./dump.sql");
