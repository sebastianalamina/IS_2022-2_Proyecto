const user = require("./utils/createUser");

let userData;
describe("/menu", () => {
  beforeAll(async () => {
    userData = await user.getUser();
  });

  test("GET /", () => {});
  test("POST /", () => {});
  test("GET /?id", () => {});
});
