const user = require("./utils/createUser");

let userData;
describe("/menu", () => {
  beforeAll(async () => {
    userData = await user.getUser();
  });

  //trae todos los menu, páginados, y filtrados
  describe("GET /", () => {
    test("paginacion de 1 elemento", () => {});
    test("paginacion de 10 elemento", () => {});
    test("paginacion trae elementos distintos en distintas paginas", () => {});
    test("paginación no falla al al acabarse los elementos", () => {});
  });
  // crea un elemento
  describe("POST /", () => {
    test("creación", () => {});
    test("permisos", () => {});
  });

  // regresa un elemento con id
  describe("GET /?id", () => {
    //trae todos los elementos del menu, páginados, y filtrados
    test("paginacion de 1 elemento", () => {});
    test("paginacion de 10 elemento", () => {});
    test("paginacion trae elementos distintos en distintas paginas", () => {});
    test("paginación no falla al al acabarse los elementos", () => {});
  });
});
