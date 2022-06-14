const { PrismaClient } = require("@prisma/client");

const { faker } = require("@faker-js/faker");

const prisma = new PrismaClient();

// Constantes para el sembrado de nuestra base de datos
const NUMERO_RESTAURANTES = 32;
const NUMERO_CLIENTES = 30;
const NUMERO_MESEROS = 10;
const NUMERO_PLATILLOS = 20;
const NUMERO_REPARTIDORES = 10;

/**
 * Se ejecuta el sembrado de la base de datos
 * Se crea la cantidad determinada de restaurantes y clientes. Cada restaurante
 * tiene el numero determinado de meseros, mas un
 */

async function seed() {
  // Se crean los repartidores
  const usuariosRepartidores = [...Array(NUMERO_REPARTIDORES)].map(() => ({
    nombre: faker.name.firstName(),
    amaterno: faker.name.lastName(),
    apatermo: faker.name.lastName(),
    confirmado: false,
  }));

  var idrepartidores = [];

  for (let h = 0; h < usuariosRepartidores.length; h++) {
    const idusuarioRepartidor = await prisma.usuario.create({
      data: {
        ...usuariosRepartidores[h],
      },
    });

    const repartidor = await prisma.repartidor.create({
      data: {
        idusuario: idusuarioRepartidor.idusuario,
      },
    });
    idrepartidores.push(repartidor.idrepartidor);
  }

  // Se crean los clientes con sus datos
  const usuariosClientes = [...Array(NUMERO_CLIENTES)].map((_) => ({
    nombre: faker.name.firstName(),
    apatermo: faker.name.lastName(),
    amaterno: faker.name.middleName(),
    confirmado: false,
  }));

  let id_clientes = [];

  for (let m = 0; m < usuariosClientes.length; m++) {
    const idusuarioCliente = await prisma.usuario.create({
      data: {
        ...usuariosClientes[m],
      },
    });
    const cliente = await prisma.cliente.create({
      data: {
        idusuario: idusuarioCliente.idusuario,
      },
    });
    id_clientes.push(cliente.idcliente);
  }

  //Creamos las entradas referentes a los restaurantes
  let id_restaurantes = [];
  for (let i = 0; i < NUMERO_RESTAURANTES - 1; i++) {
    const restaurante = await prisma.restaurante.create({
      data: {
        nombre: faker.company.companyName(),
        estado: faker.address.state(),
        calle: faker.address.streetName(),
        numero: faker.datatype.number(),
        cp: parseInt(faker.address.zipCode()),
        municipio: faker.address.city(),
      },
    });
    id_restaurantes.push(restaurante.idrestaurante);

    const platillos_data = [...Array(NUMERO_PLATILLOS)].map((_) => ({
      nombre: faker.commerce.productName(),
      costo: parseInt(faker.commerce.price()),
      idrestaurante: restaurante.idrestaurante,
    }));

    const menu = await prisma.menu.create({
      data: {
        idrestaurante: restaurante.idrestaurante,
      },
    });

    let id_platillos = [];
    for (let j = 0; j < platillos_data.length; j++) {
      const platillo = await prisma.platillo.create({
        data: {
          ...platillos_data[j],
          idmenu: menu.idmenu,
          idrestaurante: restaurante.idrestaurante,
        },
      });
      id_platillos.push(platillo.idplatillo);
    }

    const usuariosRestaurante = [...Array(NUMERO_MESEROS + 1)].map((_) => ({
      nombre: faker.name.firstName(),
      apatermo: faker.name.lastName(),
      amaterno: faker.name.middleName(),
      confirmado: false,
    }));

    const administrador = await prisma.administrador.create({
      data: {
        usuario: { create: { ...usuariosRestaurante[0] } },
        restaurante: { connect: { idrestaurante: restaurante.idrestaurante } },
      },
    });

    for (let j = 1; j < usuariosRestaurante.length; j++) {
      await prisma.mesero.create({
        data: {
          usuario: { create: { ...usuariosRestaurante[j] } },
          administrador: { connect: { idadmin: administrador.idadmin } },
          restaurante: {
            connect: { idrestaurante: restaurante.idrestaurante },
          },
        },
      });
    }

    // Cada uno de los clientes hace una resena.
    for (let m = 0; m < id_clientes.length; m++) {
      await prisma.resena.create({
        data: {
          idcliente: id_clientes[m],
          idrestaurante: restaurante.idrestaurante,
          classificacion: faker.datatype.number({ min: 0, max: 5 }),
          date: faker.date.past(),
          texto: faker.lorem.words(),
        },
      });
    }

    /**
     * Cada uno de los clientes hace una orden, la mitad de las ordenes son a domicilio 
     * con entrega null
     */
    // Se hace la primera mitad de las ordenes 
    for (
      let n = 0;
      n < parseInt(Math.min(id_clientes.length, idrepartidores.length)/2);
      n++
    ) {
      await prisma.orden.create({
        data: {
          estado: "EN_PROCESO",
          esCarrito: false,
          pagado: true,
          costo: 100,
          cliente: {
            connect: {
              idcliente: id_clientes[n],
            },
          },
          mesa: {
            create: {
              idrestaurante: restaurante.idrestaurante,
              ocupada: true,
            },
          },
          restaurante: {
            connect: {
              idrestaurante: restaurante.idrestaurante,
            },
          },
          contenido: {
            create: {
              idplatillo: id_platillos[0],
            },
          },
          entrega: {
            create: {
              idrepartidor: idrepartidores[n],
            },
          },
        },
      });
    }

    for (
      let n = parseInt(Math.min(id_clientes.length, idrepartidores.length)/2);
      n < Math.min(id_clientes.length, idrepartidores.length);
      n++
    ) {
      await prisma.orden.create({
        data: {
          estado: "EN_PROCESO",
          esCarrito: false,
          pagado: true,
          costo: 100,
          domicilio : faker.address.streetAddress(),
          cliente: {
            connect: {
              idcliente: id_clientes[n],
            },
          },
          mesa: {
            create: {
              idrestaurante: restaurante.idrestaurante,
              ocupada: true,
            },
          },
          restaurante: {
            connect: {
              idrestaurante: restaurante.idrestaurante,
            },
          },
          contenido: { create: { idplatillo: id_platillos[0] } },
          entrega: undefined
        },
      });
    }
    
  }
  console.log("BASE DE DATOS SEMBRADA");
}

seed();
