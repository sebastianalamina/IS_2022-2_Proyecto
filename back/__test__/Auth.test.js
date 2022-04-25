const request = require("supertest");
const Joi = require("joi");
const { faker } = require("@faker-js/faker");

const app = require("../app");
const validate = require("./utils/validate.js");
const exists = require("./utils/exists");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

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
    test("creación de cliente", () => {
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
    test("creación de cocinero", () => {
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
    test("creación de mesero", () => {
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
    test("creación de repartidor", () => {
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
    test("Middleware: permiso correcto", () => {});
    test("Falla con rol no existente", () => {});
  });

  test("POST /login", function (done) {
    // request(app)
    //   .post("/auth/login")
    //   .send({
    //     email: usuario,
    //     contrasegna: password,
    //   })
    //   .expect(200)
    //   .expect(
    //     validate(
    //       Joi.object({
    //         token: Joi.string(),
    //       })
    //     )
    //   )
    //   .end(done);
    done();
  });
  test("POST /rol", () => {});
});
