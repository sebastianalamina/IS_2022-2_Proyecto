const user = require("./utils/createUser");

let userData;
describe("/orden", () => {
  beforeAll(async () => {
    userData = await user.getUser();
  });

  test("POST /estado", () => {});
  test("GET /estado/?id", () => {});
});
