const { PrismaClient } = require("@prisma/client");
const { faker } = require("@faker-js/faker");
const bcrypt = require("bcrypt");

const prisma = new PrismaClient();

const hashPassword = (pwd) =>
  new Promise((res, rej) =>
    bcrypt.hash(pwd, 12, (err, password) => {
      if (err) return rej(err);
      return res(password);
    })
  );

var user = {
  _singleton: null,
  getUser: async function (qData) {
    const userData = {
      email: faker.internet.email(),
      contrasegna: await hashPassword(faker.internet.password()),
      token: "token",
      rol: "cliente",
    };
    if (qData) {
      if ("contrasegna" in qData)
        qData.contrasegna = await hashPassword(qData.contrasegna);
      return prisma.usuario.create({
        data: {
          ...userData,
          ...qData,
        },
      });
    }
    if (!this._singleton)
      this._singleton = prisma.usuario.create({
        data: userData,
      });
    return this._singleton;
  },
};

module.exports = user;
