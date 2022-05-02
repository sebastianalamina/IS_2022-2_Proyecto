const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();
const validate = require("../utils/middleware/validate");
const { estaAutenticado } = require("../utils/middleware/auth");

/**
 * @swagger
 * /resena/
 * get:
 *  description: Obtiene todas las reseñas almacenadas en la base de datos
 */
router.get("/",
    estaAutenticado,
    async (req, res) => { 
		const resenas = await prisma.resena.findMany();
		res.json(resenas)
    }
);


/**
 * @swagger
 * /resena/:idrestaurante
 * get:
 * description: Obtiene todas las reseñas de un restaurante,
 * utilizando el id del restaurante como parametro y tomando skip y take.
 */
router.get("/:idrestaurante",
    estaAutenticado,
    validate(
        Joi.object({ 
            idrestaurante: Joi.number().integer().required(),
        }),
        "params"),
    validate(
        Joi.object({
            skip : Joi.number().integer().min(0).default(0),
            take : Joi.number().integer().min(1).default(10),
        }),
        "query"),
    async (req, res) => {

        const { skip, take } = req.query;
        const {idrestaurante} = req.params
        const resenas = await prisma.resena.findMany({
            where : {
                idrestaurante
            },
            skip,
            take,
        });
        res.json(resenas);
    });

/**
 * @swagger /resena/
 * post:
 * description: Crea una reseña en la base de datos con los datos recibidos
 * en el body. 
 */
router.post("/",
    estaAutenticado,
    validate(
        Joi.object({
            idrestaurante: Joi.number().integer().required(),
            idusuario: Joi.number().integer().required(),
            comentario: Joi.string().required(),
            calificacion: Joi.number().integer().required(),
        }),
        "body"),
    async (req, res) => {
        const { idrestaurante, idusuario, comentario, calificacion } = req.body;
        const resena = await prisma.resena.create({
            data: {
                idrestaurante,
                idusuario,
                comentario,
                calificacion,
            },
        });
        res.json(resena);
    }
);
