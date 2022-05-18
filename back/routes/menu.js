const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();
const validate = require("../utils/middleware/validate");

const { hasRole } = require("../utils/middleware/auth");
const { estaAutenticado } = require("../utils/middleware/auth");

//@ts-check

router.get(
  "/:idmenu",
  validate(
    Joi.object({
      idmenu: Joi.number().required(),
    }),
    "params"
  ),
  validate(
    Joi.object({
      skip: Joi.number().integer().min(0).optional().default(0),
      take: Joi.number().integer().min(1).optional().default(20),
    }),
    "query"
  ),
  async (req, res) => {
    const { idmenu } = req.params;
    const { skip, take } = req.query;
    const menu = await prisma.platillo.findMany({
      where: {
        idmenu,
      },
      skip,
      take,
    });
    res.status(200).json(menu);
  }
);

router.post(
  "/",
  hasRole("administrador"),
  validate(
    Joi.object({
      idrestaurante: Joi.number().required(),
    }),
    "body"
  ),
  async (req, res) => {
    const { idrestaurante } = req.body;
    const menu = await prisma.menu.create({
      data: {
        idrestaurante,
      },
    });
    res.status(201).json(menu);
  }
);
module.exports = router;
