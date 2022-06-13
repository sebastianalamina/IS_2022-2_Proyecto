const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();
const validate = require("../utils/middleware/validate");

const { hasRole } = require("../utils/middleware/auth");
const { estaAutenticado } = require("../utils/middleware/auth");

/*
Este GET regresa todas las órdenes asociadas
al restaurante y a la mesa dados.
Incluye el contenido de cada orden.
*/
router.get(
    "/",
    validate(Joi.object({
        idmesa: Joi.number().integer().required(),
        idrestaurante: Joi.number().integer().required(),
    }), "query"),
    async (req, res) => {

        const orden = await prisma.orden.findMany({
            where: {
                idmesa: req.query.idmesa,
                idrestaurante: req.query.idrestaurante,
            },
            include: {
                contenido: {
                    include: {
                        platillo:true,
                    },
                },
            },
        });

        res.json(orden);
    }
)

/*
Este POST crea una orden asignándole el restaurante y la mesa dados.
Inicializa los demás valores en valores genéricos.
*/
router.post(
    "/",
    validate(Joi.object({
        idmesa: Joi.number().integer().required(),
        idrestaurante: Joi.number().integer().required(),
    }), ),
    async (req, res) => {

        const orden = await prisma.orden.create({
            data:{
                idmesa: req.body.idmesa,
                idrestaurante: req.body.idrestaurante,
                estado: "RECIBIDA",
                esCarrito: true,
                pagado: false,
                costo: 0,
            }
        });
        res.json(orden);
    }
)

/*
Este GET obtiene todos los platillos disponibles del restaurante dado.
*/
router.get(
    "/platillos/",
    validate(Joi.object({
        idrestaurante: Joi.number().integer().required(),
    }), "query"),
    async (req, res) => {

        const platillos = await prisma.platillo.findMany({
            where: {
                idrestaurante: req.query.idrestaurante,
            },
        });

        res.json(platillos);
    }
)

/*
Este POST agrega el platillo dado a la orden dada.
*/
router.post(
    "/agregar-platillo",
    validate(Joi.object({
        idplatillo: Joi.number().integer().required(),
        idorden: Joi.number().integer().required(),
    }), ),
    async (req, res) => {

        const contenidoorden = await prisma.contenidoorden.create({
            data:{
                idorden: req.body.idorden,
                idplatillo: req.body.idplatillo,
            }
        });
        res.json(contenidoorden);
    }
)

/*
Este POST elimina el contenido de orden dado.
*/
router.post(
    "/eliminar-platillo",
    validate(Joi.object({
        idcontenidoorden: Joi.number().integer().required(),
    }), ),
    async (req, res) => {

        const contenidoorden = await prisma.contenidoorden.delete({
            where:{
                idcontenidoorden: req.body.idcontenidoorden,
            }
        });
        res.json(contenidoorden);
    }
)

/*
Este POST cierra una orden
Es decir, marca el booleano esCarrito como false
y el booleano pagado como true.
*/
router.post(
    "/cerrar-orden",
    validate(Joi.object({
        idorden: Joi.number().integer().required(),
    }), ),
    async (req, res) => {


        let orden;
        try { // <- Issue #45 del repo.
            const orden = await prisma.orden.update({
                where:{
                    idorden: req.body.idorden,
                },
                data:{
                    esCarrito: false,
                    pagado: true,
                },
            });
        } catch (e) {
            if (e.meta.cause === "Record to update not found.")
                return res.status(404).send({ error: "registro no encontrado" });
        }

        res.json(orden);
    }
)

module.exports = router;

