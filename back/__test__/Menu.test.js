const user = require("./utils/createUser");
const request = require("supertest");
const app = require("../app");



let userData;
describe("/menu", () => {
  beforeAll(async () => {
    userData = await user.getUser();
  });

  //trae todos los menu, páginados, y filtrados
  describe("GET /", () => {
    test("paginacion de 1 elemento", () => {
      return request(app)
        .get("/menu?skip=0&take=1")
        .set("Authorization", `Bearer ${userData.token}`)
        .set("Rol", `Rol "MESERO" `)
        .expect(200)
        .then((res) => {
          expect(res.body.length).toBe(1);
        });
    });
    test("paginacion de 10 elemento", async () => {
      return request(app)
        .get("/menu?skip=0&take=10")
        .set("Authorization", `Bearer ${userData.token}`)
        .set("Rol", `Rol "MESERO" `)
        .expect(200)
        .then((res) => {
          expect(res.body.length).toBe(10);
        });
    });
    test("paginacion trae elementos distintos en distintas paginas", async () => {

      const res = await request(app)
      .get("/menu?skip=0&take=10")
      .set("Authorization", `Bearer ${userData.token}`)
      .set("Rol", "MESERO");

      const res2 = await request(app)
      .get("/menu?skip=10&take=10")
      .set("Authorization", `Bearer ${userData.token}`)
      .set("Rol", "MESERO");

      expect(res.body !== res2.body).toBe(true);
    });

    test("paginación no falla al al acabarse los elementos", async () => {
      return request(app)
        .get("/menu?skip=0&take=10000")
        .set("Authorization", `Bearer ${userData.token}`)
        .set("Rol", `Rol "MESERO" `)
        .expect(200) 
    });
  });
  // crea un elemento
  test("POST /", async () => {
    return request(app)
    .post("/menu")
    .send({
      idrestaurante: 1,
    })
    .expect(201)
    .then((res) => {
      expect(res.body.idrestaurante).toBe(1);
    }); 
  });
  // regresa un elemento con id
  describe("GET /?id", () => {
    //trae todos los elementos del menu, páginados, y filtrados
    test("paginacion de 1 elemento", async () => {
      return request(app)
        .get("/menu/1?skip=0&take=1")
        .set("Authorization", `Bearer ${userData.token}`)
        .set("Rol", "MESERO")
        .expect(200)
        .then((res) => {
          expect(res.body.length).toBe(1);
        });
    });
    test("paginacion de 10 elemento",  async () => {
      return request(app)
        .get("/menu/1?skip=0&take=10")
        .set("Authorization", `Bearer ${userData.token}`)
        .set("Rol", "MESERO")
        .expect(200)
        .then((res) => {
          expect(res.body.length).toBe(10);
        });

    });
    test("paginacion trae elementos distintos en distintas paginas", async () => {
      const res = await request(app)
      .get("/menu/1?skip=0&take=10")
      .set("Authorization", `Bearer ${userData.token}`)
      .set("Rol", "MESERO");

      const res2 = await request(app)
      .get("/menu/1?skip=10&take=10")
      .set("Authorization", `Bearer ${userData.token}`)
      .set("Rol", "MESERO");

      expect(res.body !== res2.body).toBe(true);
    });
    test("paginación no falla al al acabarse los elementos", () => {
      return request(app)
      .get("/menu/1?skip=0&take=1000")
      .set("Authorization", `Bearer ${userData.token}`)
      .set("Rol", "MESERO")
      .expect(200)
    });
  });
});
