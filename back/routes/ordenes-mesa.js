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

        let orden;
        try {
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
        } catch (e) {
            if (e.meta.cause === "Record to update not found.")
                return res.status(404).send({ error: "registro no encontrado" });
        }

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

        let orden;
        try {
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
        } catch (e) {
            if (e.meta.cause === "Record to update not found.")
                return res.status(404).send({ error: "registro no encontrado" });
        }

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

        let platillos;
        try {
            const platillos = await prisma.platillo.findMany({
                where: {
                    idrestaurante: req.query.idrestaurante,
                },
            });
        } catch (e) {
            if (e.meta.cause === "Record to update not found.")
                return res.status(404).send({ error: "registro no encontrado" });
        }

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

        let contenidoorden;
        try {
            const contenidoorden = await prisma.contenidoorden.create({
                data:{
                    idorden: req.body.idorden,
                    idplatillo: req.body.idplatillo,
                }
            });
        } catch (e) {
            if (e.meta.cause === "Record to update not found.")
                return res.status(404).send({ error: "registro no encontrado" });
        }

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

        let contenidoorden;
        try {
            const contenidoorden = await prisma.contenidoorden.delete({
                where:{
                    idcontenidoorden: req.body.idcontenidoorden,
                }
            });
        } catch (e) {
            if (e.meta.cause === "Record to update not found.")
                return res.status(404).send({ error: "registro no encontrado" });
        }
        
        res.json(contenidoorden);
    }
)

module.exports = router;

