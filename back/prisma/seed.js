const { PrismaClient } = require("@prisma/client");

const { faker } = require("@faker-js/faker");

const client = new PrismaClient();

const roles = [
            "CLIENTE",
            "MESERO",
            "COCINERO",
            "ADMINISTRADOR",
            "REPARTIDOR",
        ]

async function seed(){ 

    //Creamos 20 clientes
    for (let i=0; i<20; i++){
        const id_usuario_cliente = await client.usuario.create({
            data : {
                email : faker.internet.email(),
                contrasegna : faker.internet.password(),
                token : faker.random.alphaNumeric(20),
                rol: "CLIENTE",
            },
            select : {
                idusuario : true,
            }
        });

        await client.repartidor.create({
            data : {
                nombre : faker.name.firstName(),
                apatermo : faker.name.middleName(),
                amaterno : faker.name.findName(),
                idusuario : id_usuario_cliente.idusuario,
            }
        })
    }

    //Creamos las entradas referentes a los restaurantes
    // Creamos 4 restaurantes
    for (let i=0;i<3;i++){
        const id_restaurante = await client.restaurante.create({
            data:{
                nombre : faker.name.firstName(),
                estado : faker.address.state(),
                calle : faker.address.streetName(),
                numero : parseInt(faker.address.buildingNumber()),
                cp : parseInt(faker.address.zipCode()),
                municipio : faker.address.county(),
            },
            select:{
                idrestaurante:true
            }
        });

        // Le asignamos 100 resena a cada restaurante

        await client.resena.createMany({
            data: Array(100).fill(
                {
                    idrestaurante: id_restaurante.idrestaurante,
                    texto : faker.lorem.sentence({words:100}),
                    idusuario : parseInt(faker.datatype.number({min:1,max:15})),
                    classificacion : parseInt(faker.datatype.number({min:1,max:5})),
                    date : faker.date.past(),
                }
            ),
        }); 

        const id_usuario_administrador = await client.usuario.create({
            data:{
                email : faker.internet.email(),
                contrasegna : faker.internet.password(),
                token : faker.random.alphaNumeric(20),
                rol: roles[3],
            },
            select:{
                idusuario : true
            }
        });

        //Creamos el administrador del restaurante
        const id_administrador = await client.administrador.create({
            data:{
                idusuario : id_usuario_administrador.idusuario,
                idrestaurante : id_restaurante.idrestaurante,
                nombre : faker.name.firstName(),
                apatermo : faker.name.lastName(),
                amaterno : faker.name.middleName(),
            },
            select:{
                idadmin: true
            }
        });

        //Creamos dos cocineros para el restaurante
        for( let n=0; n< 2; n++){

            const id_usuario_cocinero = await client.usuario.create({
                data : {
                email : faker.internet.email(),
                contrasegna : faker.internet.password(),
                token : faker.random.alphaNumeric(20),
                rol: roles[2]
                },
                select : {
                    idusuario : true
                }
            })

            await client.cocinero.create({
                data:{
                    idadmin : id_administrador.idadmin,
                    idrestaurante : id_restaurante.idrestaurante,
                    nombre : faker.name.firstName(),
                    apaterno : faker.name.middleName(),
                    amaterno : faker.name.lastName(),
                    idusuario : id_usuario_cocinero.idusuario,
                }
            })
        }

        // Creamos tres meseros para el restaurante
        for (let n=0; n< 3; n++){
            const id_usuario_meseros = await client.usuario.create({ 
                data : {
                    email : faker.internet.email(),
                    contrasegna : faker.internet.password(),
                    token : faker.random.alphaNumeric(20),
                    rol: roles[1]
                    },
                select : {
                    idusuario : true
                }
            });

            await client.mesero.create({
                data : {
                    idadmin : id_administrador.idadmin,
                    idrestaurante : id_restaurante.idrestaurante,
                    nombre : faker.name.firstName(),
                    apatermo : faker.name.middleName(),
                    amaterno : faker.name.lastName(),
                    idusuario : id_usuario_meseros.idusuario,
                }
            });
        }

        for (let j=0; j< 2; j++){
            // Creamos dos menus y le asignamos a cada uno 4 platillos.
            const id_menu = await client.menu.create({
                data:{
                    idrestaurante : id_restaurante.idrestaurante,
                },
                select:{
                    idmenu:true
                }
            });

            for (let k=0; k< 4; k++){
                // Creamos los cuatro platillos de cada uno de los menus
                await client.platillo.create({
                    data:{
                        idmenu : id_menu.idmenu,
                        idrestaurante : id_restaurante.idrestaurante,
                        nombre : faker.commerce.productName(),
                        costo : parseInt(faker.commerce.price(0,1000,0)),
                    }
                });
            }
        }
    }

    // Creamos tres meseros para el restaurante
    for (let n = 0; n < 3; n++) {
      const id_usuario_meseros = await client.usuario.create({
        data: {
          email: faker.internet.email(),
          contrasegna: faker.internet.password(),
          token: faker.random.alphaNumeric(20),
          rol: roles[1],
        },
        select: {
          idusuario: true,
        },
      });

      await client.mesero.create({
        data: {
          idadmin: id_administrador.idadmin,
          idrestaurante: id_restaurante.idrestaurante,
          nombre: faker.name.firstName(),
          apatermo: faker.name.middleName(),
          amaterno: faker.name.lastName(),
          idusuario: id_usuario_meseros.idusuario,
        },
      });
    }

    
    

    console.log("Database sembrada")

}

seed();
