const request = require("supertest");

const app = require("../app");

describe("Ejemplo", () => {
  test("prueba del back basica", function (done) {
    request(app) //objeto para hacer pruebas
      .get("/") //metodo y ruta al que vamos a llamar
      .expect(200) //expect puede recibir una variedad de cosas que checar https://www.npmjs.com/package/supertest#API
      .then((res) => {
        //aqui podemos probar la respuesta del servidor
        // console.log(res.body); //res.body si es un json
        console.log(res.text);
        // al inicio de test defino a done como argumento
        // cuando acabe llama a done es muy importante
        done();
      });
  });
});
