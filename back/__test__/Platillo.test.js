const { faker } = require("@faker-js/faker");
const request = require("supertest");
const Joi = require("joi");
const { PrismaClient } = require("@prisma/client");

const app = require("../app");
const user = require("./utils/createUser");
const exists = require("./utils/exists");
const prisma = new PrismaClient();

describe("/platillo", () => {
  let userData;
  let menu;

  beforeAll(async () => {
    userData = await user.getUser();
    restaurante = await prisma.restaurante.create({
      data: {
        nombre: "mi restaurante",
      },
    });
    menu = await prisma.menu.create({
      data: {
        idrestaurante: restaurante.idrestaurante,
      },
    });
  });

  // crea un elemento
  describe("POST /", () => {
    test("creación", (done) => {
      request(app)
        .post("/")
        .set("Authorization", `Bearer ${userData.token}`)
        .send({
          idmenu: menu.idmenu,
          nombre: faker.animal.bird(),
          costo: faker.commerce.price(),
          descripcion: faker.commerce.productDescription(),
        })
        .expect(exists("platillo", "idplatillo"))
        .then(() => done())
        .catch(done);
    });
    describe("permisos", () => {
      test("falla porque no es dueño del menu", () => {});
      test("es administrador", () => {});
    });
  });

  // regresa un elemento con id
  describe("GET /?id", () => {
    //trae todos los elementos del menu, páginados, y filtrados
    test("paginacion de 1 elemento", () => {});
    test("paginacion de 10 elemento", () => {});
    test("paginacion trae elementos distintos en distintas paginas", () => {});
    test("paginación no falla al al acabarse los elementos", () => {});
  });

  test("POST /opina", () => {});

  // agregar al carrito
  describe("Post /agrega/?id", () => {
    test("agrega elemento al carrito", () => {});
  });
});
