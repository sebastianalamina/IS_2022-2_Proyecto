const { PrismaClient } = require("@prisma/client");

const { faker } = require("@faker-js/faker");

const prisma = new PrismaClient();

const roles = ["CLIENTE", "MESERO", "COCINERO", "ADMINISTRADOR", "REPARTIDOR"];

async function seed() {
  //Creamos las entradas referentes a los restaurantes
  for (let i = 0; i< 30; i ++) {
    // Creamos un restaurate
    const idUsuarioAdmin = await prisma.usuario.create({
      data: {
        nombre: faker.name.firstName(),
        amaterno : faker.name.lastName(),
        apatermo : faker.name.lastName(),
        email: faker.internet.email(),
        rol: "ADMINISTRADOR",
        confirmado : false 
      },
      select : {
        idusuario : true
      }
    });
    const restaurante = await prisma.restaurante.create({
      data:{
        nombre: faker.company.companyName(),
        estado: faker.address.state(),
        calle: faker.address.streetName(),
        numero: faker.datatype.number(),
        cp: parseInt(faker.address.zipCode()),
        municipio: faker.address.city(),
        administrador:{
          create:{ idusuario : idUsuarioAdmin.idusuario }
        } 
        

      },
      select:{
        idrestaurante: true,
        administrador :{
          select:{
            idusuario: true,
            idadmin : true,
          }
        }
      }
    });
    // Creamos los meseros que trabajan en el restaurante:
   for (let j = 0; j < 5; j++) {
    const mesero = await prisma.mesero.create({
      data:{
        usuario:{
          create:{
            nombre: faker.name.firstName(),
            amaterno : faker.name.lastName(),
            apatermo : faker.name.lastName(),
            email: faker.internet.email(),
            rol : "MESERO",
            confirmado : false
            },
          },
          restaurante : {
            connect :{
              idrestaurante : restaurante.idrestaurante
            }
          },
          administrador : {
            connect : {
              idadmin : restaurante.administrador.idadmin,
              idrestaurante : restaurante.idrestaurante,
              idusuario : restaurante.administrador.idusuario,
            }
          }
        } 
    });
   }

  for(let k = 0; k < 2; k++){
    const platillos = Array(15).fill({
      nombre : faker.commerce.productName(),
      costo : parseInt(faker.commerce.price()),
      idrestaurante : restaurante.idrestaurante,
    })
    const menu = await prisma.menu.create({
      data:{
        idrestaurante : restaurante.idrestaurante,
        platillo : {
          createMany:{ data: platillos }
          } 

        }
      });
    }
  }
  
}

seed();