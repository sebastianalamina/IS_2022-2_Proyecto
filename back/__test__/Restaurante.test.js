const user = require("./utils/createUser");

let userData;
describe("/menu", () => {
  beforeAll(async () => {
    userData = await user.getUser();
  });

  describe("GET /", () => {
    test("paginacion de 1 elemento", () => {});
    test("paginacion de 10 elemento", async () => {});
    test("paginacion trae elementos distintos en distintas paginas", async () => {});
    test("paginación no falla al al acabarse los elementos", async () => {});
  });
  test("POST /", () => {});
  test("GET /?id", () => {});
});
