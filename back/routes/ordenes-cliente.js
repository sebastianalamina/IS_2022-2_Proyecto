const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();
const validate = require("../utils/middleware/validate");

const { hasRole } = require("../utils/middleware/auth");
const { estaAutenticado } = require("../utils/middleware/auth");


//Regresa la orden dado un id
router.get("/:idorden",
    validate(
        Joi.object({
            idorden: Joi.number.integer().required(),
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

//platillos de una orden/carrito dado el id
router.get("/:idorden/platillos",
    validate(
        Joi.object({
            idorden: Joi.number.integer().required(),
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

//crea una orden
router.post("/",
    estaAutenticado,
    hasRole("cliente"),
    validate(
        Joi.object({
            idorden: Joi.number().integer.required(),
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

//agregar platillos
router.post('/:idorden/:idplatillo',
    estaAutenticado,
    hasRole("cliente"),
    validate(
        Joi.object({
            idorden: Joi.number().integer().required(),
            idplatillo: Joi.number.integer().required(),
        }),
        "body"
    ),
    async (req,res) => {
        const { idorden, idplatillo} = req.body;
        const platillo = await prisma.contenidoorden.create({
            idorden : idorden,
            idplatillo : idplatillo,
        });
        res.json(platillo)
    }
)

//eliminar platillos
router.delete('/:idorden/:idplatillo',
    estaAutenticado,
    hasRole("cliente"),
    validate(
        Joi.object({
            idorden: Joi.number().integer().required(),
            idplatillo: Joi.number.integer().required(),
        }),
        "body"
    ),
    async (req, res) => {
        const {idorden, idplatillo} = req.body;
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
        try {
            const anterior = await prisma.orden.findUnique({
                where: {idorden :idorden},
                select: {
                    esCarrito : true,
                },
            })

            const actualizado = await prisma.orden.update({
                where: {idorden : idorden},
                data: {esCarrito: !anterior?.esCarrito},
            })
            res.json(actualizado)
        } catch (error) {
            res.json({error: `La orden ${idorden} no existe en la base de datos`})
        }
    }
)



module.exports = router;

