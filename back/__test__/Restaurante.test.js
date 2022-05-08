const user = require("./utils/createUser");

const request = require("supertest");
const app = require("../app");

let userData;
describe("/restaurante", () => {
  beforeAll(async () => {
    userData = await user.getUser();
  });

  test("GET /", () => {
    return request(app)
      .get("/restaurante")
      .set("Authorization", `Bearer ${userData.token}`)
      .query({skip :'10'})
      .then((res) => {
        expect(res.status).toBe(200);
        expect(res.body).toHaveLength(10);
      });

  });
  test("POST /", () => {});
  test("GET /:id", () => {});
});
