const express = require("express");
const { PrismaClient, estadoorden } = require("@prisma/client");
const { hasRole } = require("../utils/middleware/auth");
const roles = require("../utils/constants/roles");
const validate = require("../utils/middleware/validate");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();

// TODO:  agregar restaurantes a la base de datos y query

router.get(
  "/disponibles",
  //hasRole(roles.REPARTIDOR),
  validate(
    Joi.object({
      skip: Joi.number().integer().optional().default(0),
    }),
    "query"
  ),
  async (req, res) => {
    const ordenesADomicilioDisponibles = {
      estado: { in: [estadoorden.EN_PROCESO, estadoorden.RECIBIDA] },
      entrega: { is: null },
      domicilio: { not: undefined },
    };
    const numOrdenes = await prisma.orden.count({
      where: ordenesADomicilioDisponibles,
    });
    if (numOrdenes == 0 || numOrdenes <= req.query.skip)
      return res.send({ orden: null });
    skip = (req.user.idusuario + req.query.skip) % numOrdenes;
    orden = await prisma.orden.findFirst({
      where: ordenesADomicilioDisponibles,
      skip,
    });
    res.send({ orden });
  }
);

router.get(
  "/:id/aceptar",
  //hasRole(roles.REPARTIDOR),
  validate(
    Joi.object({
      id: Joi.number().integer(),
    }),
    "params"
  ),
  async (req, res) => {
    const count = await prisma.orden.count({
      where: {
        estado: { in: [estadoorden.EN_PROCESO, estadoorden.RECIBIDA] },
        idorden: req.params.id,
        entrega: { is: null },
        domicilio: { not: undefined },
      },
    });
    if (count == 0) return res.send({ error: "order not available" });
    const repartidor = await prisma.repartidor.findFirst({
      where: { idusuario: req.user.idusuario },
    });
    const entrega = await prisma.entregadomicilio.create({
      data: {
        idrepartidor: repartidor.idrepartidor,
        idorden: req.params.id,
      },
    });
    res.send({ entrega });
  }
);
module.exports = router;
