const { PrismaClient } = require("@prisma/client");

const { faker } = require("@faker-js/faker");

const client = new PrismaClient();

const roles = ["CLIENTE", "MESERO", "COCINERO", "ADMINISTRADOR", "REPARTIDOR"];

async function seed() {
  //Creamos las entradas referentes a los restaurantes
  let restaurantes = [];
  for (let i = 0; i < 3; i++) {
    // Creamos 4 restaurantes
    const id_restaurante = await client.restaurante.create({
      data: {
        nombre: faker.name.firstName(),
        estado: faker.address.state(),
        calle: faker.address.streetName(),
        numero: 12,
        cp: parseInt(faker.address.zipCode()),
        municipio: faker.address.county(),
      },
      select: {
        idrestaurante: true,
      },
    });

    restaurantes.push(id_restaurante);

    const id_usuario_administrador = await client.usuario.create({
      data: {
        email: faker.internet.email(),
        contrasegna: faker.internet.password(),
        token: faker.random.alphaNumeric(20),
        rol: roles[3],
        confirmado: faker.datatype.boolean(), // ¡Poblando con usuarios que ya confirmaron su correo, y con usuarios que no!
        nombre: faker.name.firstName(), // Llenando sólo el nombre de los usuarios.
      },
      select: {
        idusuario: true,
      },
    });

    //Creamos el administrador del restaurante
    const id_administrador = await client.administrador.create({
      data: {
        idusuario: id_usuario_administrador.idusuario,
        idrestaurante: id_restaurante.idrestaurante,
        // Nombre completo ahora en tabla "Usuario".
        //nombre: faker.name.firstName(),
        //apatermo: faker.name.lastName(),
        //amaterno: faker.name.middleName(),
      },
      select: {
        idadmin: true,
      },
    });

    //Creamos dos cocineros para el restaurante
    /*
    for (let n = 0; n < 2; n++) {
      const id_usuario_cocinero = await client.usuario.create({
        data: {
          email: faker.internet.email(),
          contrasegna: faker.internet.password(),
          token: faker.random.alphaNumeric(20),
          rol: roles[2],
          confirmado: faker.datatype.boolean(), // ¡Poblando con usuarios que ya confirmaron su correo, y con usuarios que no!
          nombre: faker.name.firstName(), // Llenando sólo el nombre de los usuarios.
        },
        select: {
          idusuario: true,
        },
      });

      await client.cocinero.create({
        data: {
          idadmin: id_administrador.idadmin,
          idrestaurante: id_restaurante.idrestaurante,
          // Nombre completo ahora en tabla "Usuario".
          //nombre: faker.name.firstName(),
          //apaterno: faker.name.middleName(),
          //amaterno: faker.name.lastName(),
          idusuario: id_usuario_cocinero.idusuario,
        },
      });
    }
    */

    // Creamos tres meseros para el restaurante
    for (let n = 0; n < 3; n++) {
      const id_usuario_meseros = await client.usuario.create({
        data: {
          email: faker.internet.email(),
          contrasegna: faker.internet.password(),
          token: faker.random.alphaNumeric(20),
          rol: roles[1],
          confirmado: faker.datatype.boolean(), // ¡Poblando con usuarios que ya confirmaron su correo, y con usuarios que no!
          nombre: faker.name.firstName(), // Llenando sólo el nombre de los usuarios.
        },
        select: {
          idusuario: true,
        },
      });

      await client.mesero.create({
        data: {
          idadmin: id_administrador.idadmin,
          idrestaurante: id_restaurante.idrestaurante,
          // Nombre completo ahora en tabla "Usuario".
          //nombre: faker.name.firstName(),
          //apaterno: faker.name.middleName(),
          //amaterno: faker.name.lastName(),
          idusuario: id_usuario_meseros.idusuario,
        },
      });
    }

    for (let j = 0; j < 2; j++) {
      // Creamos dos menus y le asignamos a cada uno 4 platillos.
      const id_menu = await client.menu.create({
        data: {
          idrestaurante: id_restaurante.idrestaurante,
        },
        select: {
          idmenu: true,
        },
      });

      for (let k = 0; k < 25; k++) {
        // Creamos los cuatro platillos de cada uno de los menus
        await client.platillo.create({
          data: {
            idmenu: id_menu.idmenu,
            idrestaurante: id_restaurante.idrestaurante,
            nombre: faker.commerce.productName(),
            costo: parseInt(faker.commerce.price(0, 1000, 0)),
            img: faker.internet.url(), // Poblando imágenes con enlaces.
          },
        });
      }
    }

    // Agregamos un número arbitrario de mesas.
    for (let i = 0; i < faker.datatype.number({min:6, max:40}); i++) {
      await client.mesa.create({
        data: {
          idrestaurante: id_restaurante.idrestaurante,
          ocupada: faker.datatype.boolean(), // Poblando con mesas ocupadas y disponibles.
        },
      });
    }

  }

  // Creamos 10 repartidores

  for (let i = 0; i < 10; i++) {
    const id_usuario_repartidor = await client.usuario.create({
      data: {
        email: faker.internet.email(),
        contrasegna: faker.internet.password(),
        token: faker.random.alphaNumeric(20),
        rol: "REPARTIDOR",
        confirmado: faker.datatype.boolean(), // ¡Poblando con usuarios que ya confirmaron su correo, y con usuarios que no!
        nombre: faker.name.firstName(), // Llenando sólo el nombre de los usuarios.
      },
      select: {
        idusuario: true,
      },
    });

    await client.repartidor.create({
      data: {
        // Nombre completo ahora en tabla "Usuario".
        //nombre: faker.name.firstName(),
        //apaterno: faker.name.middleName(),
        //amaterno: faker.name.lastName(),
        idusuario: id_usuario_repartidor.idusuario,
      },
    });
  }

  //Creamos 20 clientes
  let clientes = [];
  for (let i = 0; i < 20; i++) {
    const id_cliente = await client.usuario.create({
      data: { 
        email: faker.internet.email(),
        contrasegna: faker.internet.password(),
        token : faker.datatype.uuid(),
        rol: "CLIENTE",
        confirmado: faker.datatype.boolean(), // ¡Poblando con usuarios que ya confirmaron su correo, y con usuarios que no!
        nombre: faker.name.firstName(), // Llenando sólo el nombre de los usuarios.
      },
      select:{
        idusuario:true
      }
      });

    const cliente = await client.cliente.create({
      data:{
            // Nombre completo ahora en tabla "Usuario".
            // nombre: faker.name.firstName(),
            // apatermo : faker.name.middleName(),
            // amaterno : faker.name.lastName(),
            // Dirección completa ahora en tabla "Usuario".
            // estado : faker.address.state(),
            // calle : faker.address.streetName(),
            // numero : faker.datatype.number(),
            // cp : parseInt(faker.address.zipCode()),
            // municipio : faker.address.county(),
            idusuario : id_cliente.idusuario
        },
        select:{
         idcliente: true 
        }
    })
    clientes.push(cliente);
  }

  for(let i = 0; i < restaurantes.length; i++){
    for(let j = 0; j <clientes.length; j++){
      //console.log(restaurantes[i].idrestaurante);
      await client.resena.create({
        data: {
          classificacion: faker.datatype.number({min:1, max:5}),
          texto : faker.lorem.sentence(),
          date : faker.date.recent(),
          idrestaurante : restaurantes[i].idrestaurante,
          idcliente : clientes[j].idcliente
        }
      })
    }
  }

  console.log("Database sembrada");
}

seed();