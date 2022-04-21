const request = require("supertest");
const Joi = require("joi");

const app = require("../app");
const validate = require("./utils/validate.js");

describe("/auth", () => {
  test("POST /login", function (done) {
    request(app)
      .post("/auth/login")
      .send({
        email: "a@unam.mx",
        contrasegna: "1",
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
});
