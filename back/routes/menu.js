const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();
const validate = require("../utils/middleware/validate");

//@ts-check
router.get(
  "/",
  (req, res, next) => {
    console.log("hola");
    next();
  },
  validate(
    Joi.object({
      id_menu: Joi.number().integer().required(),
      id_restaurante: Joi.number().integer().required(),
    }),
    "query"
  ),
  async (req, res) => {
    let id_restaurante = req.query.id_restaurante;
    let id_menu = req.query.id_menu;
    const platillo = await prisma.platillo.findMany({
      where: {
        idmenu: id_menu,
        idrestaurante: id_restaurante,
      },
    });
    res.status(200).json(platillo);
  }
);

module.exports = router;
