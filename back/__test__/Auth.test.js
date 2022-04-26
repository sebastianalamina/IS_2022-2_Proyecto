const request = require("supertest");
const Joi = require("joi");
const { faker } = require("@faker-js/faker");

const app = require("../app");
const validate = require("./utils/validate.js");
const exists = require("./utils/exists");
const createUser = require("./utils/createUser");
const { PrismaClient } = require("@prisma/client");
let roles = require("../utils/constants/roles");

const prisma = new PrismaClient();
roles = Object.values(roles).map((x) => x.toLowerCase());

async function getUserRol(rol, query) {
  let baseUser = await prisma.usuario.findFirst({ where: query });
  return await prisma[rol].findFirst({
    where: {
      idusuario: baseUser.idusuario,
    },
  });
}

describe("/auth", () => {
  describe("POST /register", () => {
    test("Respuesta correcta de usuario", function (done) {
      let usuario = faker.internet.email();
      let password = faker.internet.password();
      request(app)
        .post("/auth/register")
        .send({
          email: usuario,
          contrasegna: password,
          rol: "mesero",
        })
        .expect(200)
        .expect(
          validate(
            Joi.object({
              email: Joi.string(),
            })
          )
        )
        .expect(exists("usuario", "idusuario"))
        .expect(({ body }) => expect(body.email).toBe(usuario))
        .end(done);
    });
    test("creación de administrador", (done) => {
      const rol = "administrador";
      request(app)
        .post("/auth/register")
        .send({
          email: faker.internet.email(),
          contrasegna: faker.internet.password(),
          rol,
        })
        .expect(200)
        .then(({ body }) => getUserRol(rol, body))
        .then((rolUser) => {
          expect(rolUser).not.toBeFalsy();
          done();
        })
        .catch(done);
    });
    test("creación de cliente", (done) => {
      const rol = "cliente";
      request(app)
        .post("/auth/register")
        .send({
          email: faker.internet.email(),
          contrasegna: faker.internet.password(),
          rol,
        })
        .expect(200)
        .then(({ body }) => getUserRol(rol, body))
        .then((rolUser) => {
          expect(rolUser).not.toBeFalsy();
          done();
        })
        .catch(done);
    });
    test("creación de cocinero", (done) => {
      const rol = "cocinero";
      request(app)
        .post("/auth/register")
        .send({
          email: faker.internet.email(),
          contrasegna: faker.internet.password(),
          rol,
        })
        .expect(200)
        .then(({ body }) => getUserRol(rol, body))
        .then((rolUser) => {
          expect(rolUser).not.toBeFalsy();
          done();
        })
        .catch(done);
    });
    test("creación de mesero", (done) => {
      const rol = "mesero";
      request(app)
        .post("/auth/register")
        .send({
          email: faker.internet.email(),
          contrasegna: faker.internet.password(),
          rol,
        })
        .expect(200)
        .then(({ body }) => getUserRol(rol, body))
        .then((rolUser) => {
          expect(rolUser).not.toBeFalsy();
          done();
        })
        .catch(done);
    });
    test("creación de repartidor", (done) => {
      const rol = "repartidor";
      request(app)
        .post("/auth/register")
        .send({
          email: faker.internet.email(),
          contrasegna: faker.internet.password(),
          rol,
        })
        .expect(200)
        .then(({ body }) => getUserRol(rol, body))
        .then((rolUser) => {
          expect(rolUser).not.toBeFalsy();
          done();
        })
        .catch(done);
    });
    test("Falla con rol no existente", (done) => {
      const rol = "repartidor";
      request(app)
        .post("/auth/register")
        .send({
          email: faker.internet.email(),
          contrasegna: faker.internet.password(),
          rol: "rol no existente",
        })
        .expect(400)
        .end(done);
    });
  });

  describe("POST /login", () => {
    test("Regresa un token", async function () {
      let contrasegna = faker.internet.password();
      const user = await createUser.getUser({ contrasegna });
      await request(app)
        .post("/auth/login")
        .send({
          email: user.email,
          contrasegna: contrasegna,
        })
        .expect(200)
        .expect(
          validate(
            Joi.object({
              token: Joi.string(),
            })
          )
        );
    });
  });

  test("POST /rol", (done) => {
    const rol = "mesero";
    createUser
      .getUser({ rol })
      .then((user) =>
        request(app)
          .post("/auth/rol")
          .set("Authorization", `Bearer ${user.token}`)
          .expect(({ body }) => expect(body.rol).toBe(rol))
      )
      .catch(done);
  });
});
