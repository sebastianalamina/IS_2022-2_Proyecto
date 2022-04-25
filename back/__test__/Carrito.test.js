const user = require("./utils/createUser");

let userData;
describe("/carrito", () => {
  beforeAll(async () => {
    userData = await user.getUser();
  });

  test("POST /new", () => {});
  test("POST /?id", () => {});
  test("POST /?id/add", () => {});
});
