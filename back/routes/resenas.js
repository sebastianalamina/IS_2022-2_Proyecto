const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();
const validate = require("../utils/middleware/validate");
const { esCliente, bearerAuth } = require("../utils/middleware/auth");

/**
 * @swagger
 * /resena/
 * get:
 *  description: Obtiene todas las reseñas almacenadas en la base de datos
 */
router.get(
  "/",
  //estaAutenticado,
  validate(
    Joi.object({
      skip: Joi.number().integer().min(0).default(0),
      take: Joi.number().integer().min(1).default(10),
    }),
    "query"
  ),
  async (req, res) => {

    try {  // <- Issue #45 del repo.
      const resenas = await prisma.resena.findMany();
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
        return res.status(404).send({ error: "registro no encontrado" });
    }

    res.json(resenas);
  }
);

/**
 * @swagger
 * /resena/:idrestaurante
 * get:
 * description: Obtiene todas las reseñas de un restaurante,
 * utilizando el id del restaurante como parametro y tomando skip y take.
 */
router.get(
  "/:idrestaurante",
  //estaAutenticado,
  validate(
    Joi.object({
      idrestaurante: Joi.number().integer().required(),
    }),
    "params"
  ),
  validate(
    Joi.object({
      skip: Joi.number().integer().min(0).default(0),
      take: Joi.number().integer().min(1).default(10),
    }),
    "query"
  ),
  async (req, res) => {
    const { skip, take } = req.query;
    const { idrestaurante } = req.params;

    try {  // <- Issue #45 del repo.
      const resenas = await prisma.resena.findMany({
        where: {
          idrestaurante,
        },
        skip,
        take,
        include: {
          cliente: {
            select: {
              usuario: {
                select: {
                  nombre: true,
                  apatermo: true,
                  amaterno: true,
                },
              },
            },
          },
          restaurante: {
            select: {
              nombre: true,
            },
          },
        },
      });
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
        return res.status(404).send({ error: "registro no encontrado" });
    }

    res.json(resenas);
  }
);

/**
 * @swagger /resena/
 * post:
 * description: Crea una reseña en la base de datos con los datos recibidos
 * en el body.
 */
router.post(
  "/",
  //estaAutenticado,
  //esCliente,
  validate(
    Joi.object({
      idrestaurante: Joi.number().integer().required(),
      texto: Joi.string().required(),
      classificacion: Joi.number().integer().required(),
      date: Joi.date().iso(),
    }),
    "body"
  ),
  async (req, res) => {
    const { idrestaurante, texto, classificacion, date } = req.body;

    try {  // <- Issue #45 del repo.
      const resena = await prisma.resena.create({
        data: {
          texto: texto,
          classificacion: classificacion,
          date: date,
          cliente: {
            connect: { idusuario: req.user.idusuario },
          },
          restaurante: {
            connect: { idrestaurante: idrestaurante },
          },
        },
        include: {
          cliente: {
            select: {
              nombre: true,
              amaterno: true,
              apatermo: true,
            },
          },
        },
      });
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
        return res.status(404).send({ error: "registro no encontrado" });
    }
    
    res.json(resena);
  }
);

module.exports = router;
