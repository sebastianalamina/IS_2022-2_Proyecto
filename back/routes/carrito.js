const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();


const validate = require("../utils/middleware/validate");
const { JsonableValue } = require("ts-jest");
const { join } = require("@prisma/client/runtime");

/**
 * @api {post} /carrito crea un carrito nuevo en la base de datos
 * 
 */
router.post("/",
  validate(
    Joi.object({
        idcliente: Joi.number().integer().required(),
        costo : Joi.number().required(),
        contenido : Joi.array().items({
            idplatillo : Joi.number().integer().required()
        })
    }),
    "body"),
    async (req, res) => {
        const {idcliente, costo, contenido} = req.body;

        try { // <- Issue #45 del repo.
            const carrito = await prisma.carrito.create({
                data:{
                    costo : costo,
                    cliente :{
                        connect:{
                            idcliente : idcliente
                        }
                    },
                },
                select: {
                    idcarrito : true,
                    cliente : true
                }
            });
        } catch (e) {
          if (e.meta.cause === "Record to update not found.")
              return res.status(404).send({ error: "registro no encontrado" });
        }

        console.log("Los datos del carrito son: ", JSON.stringify(carrito));
        
        try { // <- Issue #45 del repo.
            const contenidoCarrito = await prisma.contenidoCarrito.createMany({
                data : contenido.map( obj=>({...obj, idcarrito: carrito.idcarrito }))
            });
        } catch (e) {
          if (e.meta.cause === "Record to update not found.")
              return res.status(404).send({ error: "registro no encontrado" });
        }

        prisma.modificarCarrito.create({
            data:{
                idcarrito : carrito.idcarrito,
                idcliente : idcliente
            }
        });

        res.json(carrito);
    });

/**
 * @api {put} /carrito/:idcarrito perimite modificar el carrito con el id dado.
 * Recibe como parametros de query el tipo del update que se va a realizar y el id de pltatillo
 */
router.put("/:idcarrito",
    validate(
        Joi.object({
            idcliente : Joi.number().integer().required(),
            tipo : Joi.string().required(),
            idplatillo : Joi.number().integer().required()
        })
    ,
    "query"
    ),
    async (res,req)=>{
       // Determinamos si el id del carrito existe
       const { idlciente, tipo, idplatillo} = req.query;
        const {idcarrito, } = req.params;

        try { // <- Issue #45 del repo.
            const carrito = await prisma.carrito.findFirst({
                 where:{
                     idcarrito : idcarrito 
                 }
             });
        } catch (e) {
          if (e.meta.cause === "Record to update not found.")
              return res.status(404).send({ error: "registro no encontrado" });
        }

         if (!carrito) {
            res.code(101);
         }
         if( tipo === "REMOVE"){

            try { // <- Issue #45 del repo.
                const contenidoRemovido = await prisma.contenidoCarrito.deleteMany({
                    where :{
                        idplatillo : idplatillo,
                        idcarrito : idcarrito
                    }
                });
            } catch (e) {
              if (e.meta.cause === "Record to update not found.")
                  return res.status(404).send({ error: "registro no encontrado" });
            }
  
            req.json(contenidoRemovido);

         }else if(tipo === "ADD"){

            try { // <- Issue #45 del repo.
                const contenidoAgregado = await prisma.contenidoCarrito.createMany({
                    data: idArticulos.map(obj=>({...obj, idcarrito: idcarrito}))
                });
            } catch (e) {
              if (e.meta.cause === "Record to update not found.")
                  return res.status(404).send({ error: "registro no encontrado" });
            }

            req.json(contenidoAgregado)
         }
    }
);

router.get('/display/:id', async (req, res) => {
    let id_cliente = req.query.id_cliente;

    try { // <- Issue #45 del repo.
        const id_carrito = await prisma.modificarCarrito.findFirst({
            where: { idcliente: id_cliente}
        });
        const contenido = await prisma.contenidoCarrito.findMany({
            where: {idcarrito: id_carrito}
        });
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
          return res.status(404).send({ error: "registro no encontrado" });
    }


    console.log(contenido)
    res.json(contenido)
  });

  module.exports = router;