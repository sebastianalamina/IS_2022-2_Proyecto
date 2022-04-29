const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();
const validate = require("../utils/middleware/validate");
const { estaAutenticado } = require("../utils/middleware/auth");


router.get("/",
    estaAutenticado,
    async (req, res) => { 
		const resenas = await prisma.resena.findMany();
		res.json(resenas)
    }
);


/**
 * @swagger
 * /resena/:idrestaurante:
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
        }),
        "query"),
    async (req, res) => {
        const resenas = await prisma.resena.findMany({
            where : {
                idrestaurante: req.params.idrestaurante,
            },
            skip: req.query.skip,
            take: 10,
        });
        res.json(resenas);
    });
