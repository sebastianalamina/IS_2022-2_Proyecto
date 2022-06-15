const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();
const validate = require("../utils/middleware/validate");

const { hasRole, bearerAuth } = require("../utils/middleware/auth");
const { estaAutenticado } = require("../utils/middleware/auth");


//crea una orden
router.post("/",
    estaAutenticado,
    hasRole("cliente"),
    validate(
        Joi.object({
            idorden: Joi.number().integer().required(),
            idcliente: Joi.number().integer().required(),
            mesa: Joi.string(),
            domicilio: Joi.string(),
            estado: Joi.number().integer().required(),
            esCarrito: Joi.boolean().required(),
            pagado: Joi.boolean().required(),
            costo: Joi.number().required()
        }),
        "body"
    ),
    async (req,res) => {
        const {idorden, mesa, domicilio, estado, esCarrito, pagado, costo} = req.body;
        const orden = await prisma.orden.create({
            idorden : idorden,
            mesa : mesa,
            domicilio : domicilio,
            estado : estado,
            esCarrito : esCarrito,
            pagado : pagado,
            costo : costo,
        });
        res.json(orden)
    }
)

//Regresa el carrito de un cliente
router.get("/carrito",
     bearerAuth,
     async (req, res) => {

        const cliente = await prisma.cliente.findFirst({
            where: {
                idusuario : req.user.idusuario,
            }
        })

        const orden = await prisma.orden.findFirst({
            
            where: {
                idcliente: cliente.idcliente,
                esCarrito: true,
            },

        });

        res.json(orden)

    }
)

//Regresa la orden dado un id
router.get("/orden/:idorden",
    validate(
        Joi.object({
            idorden: Joi.number().integer().required(),
        }),
        "params"
    ),
    async (req, res) => {

        const orden = await prisma.orden.findFirst({
            where: {
                idorden: req.params.idorden,
            },

        });

        res.json(orden)

    }
)

//ordenes de un cliente que no son carrito
router.get("/ordenes",
     bearerAuth,
     validate(
        Joi.object({
            idcliente: Joi.number().integer().required(),
        }),
        "params"
    ),
    async (req, res) => {

        const cliente = await prisma.cliente.findFirst({
            where: {
                idcliente : req.user.idcliente,
            }
        })

        const orden = await prisma.orden.findMany({
            where: {
                idcliente: cliente.idcliente,
                esCarrito: false
            },

        });

        res.json(orden)

    }
)


//platillos de una orden/carrito dado el id
router.get("/platillos/:idorden",
    validate(
        Joi.object({
            idorden: Joi.number().integer().required(),
        }),
        "params"
    ),
    async (req, res) => {
        const { idorden } = req.params;
        const platillos = await prisma.contenidoorden.findMany({
            where: {
                idorden
            }
        });
        res.json(platillos)
    }
)

//agregar platillos
router.post('/adddish/:idorden/:idplatillo',
    //estaAutenticado,
    //hasRole("cliente"),
    validate(
        Joi.object({
            idorden: Joi.number().integer().required(),
            idplatillo: Joi.number().integer().required(),
        }),
        "params"
    ),
    async (req,res) => {
        const { idorden, idplatillo} = req.params;
        const platillo = await prisma.contenidoorden.create({
            data: {
                idorden : idorden,
                idplatillo : idplatillo,
            }
        });
        res.json(platillo)
    }
)

//eliminar platillos
router.delete('/deletedish/:idorden/:idplatillo',
    estaAutenticado,
    hasRole("cliente"),
    validate(
        Joi.object({
            idorden: Joi.number().integer().required(),
            idplatillo: Joi.number().integer().required(),
        }),
        "params"
    ),
    async (req, res) => {
        const {idorden, idplatillo} = req.params;
        const paltillo = await prisma.contenidoorden.delete({
            where: {
                idorden : idorden,
                idplatillo : idplatillo,
            }
        });
        res.json(platillo)
    }
)

//confirmar una orden
router.put('/:idorden',
    estaAutenticado,
    hasRole("cleinte"),
    validate(
        Joi.object({
            idorden: Joi.number().integer().required(),
        }),
        "params"
    ),
    async (req,res) => {
        const {idorden} = req.params
        let anterior, actualizado;
        try {
            anterior = await prisma.orden.findUnique({
                where: {idorden :idorden},
                select: {
                    esCarrito : true,
                },
            });

            actualizado = await prisma.orden.update({
                where: {idorden : idorden},
                data: {esCarrito: !anterior.esCarrito},
            });
            res.json(actualizado)
        } catch (error) {
            res.json({error: `La orden ${idorden} no existe en la base de datos`})
        }
    }
)



module.exports = router;
