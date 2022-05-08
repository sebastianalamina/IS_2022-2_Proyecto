const user = require("./utils/createUser");
const request = require("supertest");
const app = require("../app");

let userData;
describe("/resena",()=>{
    beforeAll(async () => {
        userData = await user.getUser();
    });
    test("GET /",()=>{});
    test("POST /",()=>{});
    test("GET /:id",()=>{});
});