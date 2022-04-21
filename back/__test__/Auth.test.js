const request = require("supertest");
const Joi = require("joi");
const { faker } = require("@faker-js/faker");

const app = require("../app");
const validate = require("./utils/validate.js");

describe("/auth", () => {
  let usuario = faker.internet.email();
  let password = faker.internet.password();

  describe("POST /register", () => {
    test("Respuesta correcta de usuario", function (done) {
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
        .end(done);
    });
    test("creación de administrador", () => {});
    test("creación de cliente", () => {});
    test("creación de cocinero", () => {});
    test("creación de mesero", () => {});
    test("creación de repartidor", () => {});
    test("Middleware: permiso correcto", () => {});
  });

  test("POST /login", function (done) {
    request(app)
      .post("/auth/login")
      .send({
        email: usuario,
        contrasegna: password,
      })
      .expect(200)
      .expect(
        validate(
          Joi.object({
            token: Joi.string(),
          })
        )
      )
      .end(done);
  });
  test("POST /rol", () => {});
});
