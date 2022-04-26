const { PrismaClient } = require("@prisma/client");
const { faker } = require("@faker-js/faker");

const prisma = new PrismaClient();

var user = {
  _singleton: null,
  getUser: function () {
    if (!this._singleton) {
      this._singleton = prisma.usuario.create({
        data: {
          email: faker.internet.email(),
          contrasegna: faker.internet.password(),
          token: "token",
        },
      });
      return this._singleton;
    }
  },
};

module.exports = user;
