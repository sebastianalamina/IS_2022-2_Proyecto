const express = require("express");
const { PrismaClient, estadoorden } = require("@prisma/client");
const { hasRole } = require("../utils/middleware/auth");
const roles = require("../utils/constants/roles");
const validate = require("../utils/middleware/validate");

const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();

// TODO:  agregar restaurantes a la base de datos y query

async function bloqueaSiTieneOrdenesPendientes(req, res, next) {

  let repartidor, ordenesPendientes;
  try { // <- Issue #45 del repo.
    const repartidor = await prisma.repartidor.findFirst({
      where: { idusuario: req.user.idusuario },
    });
    const ordenesPendientes = await prisma.entregadomicilio.count({
      where: {
        idrepartidor: repartidor.idrepartidor,
        orden: {
          estado: { not: estadoorden.ENTREGADA },
        },
      },
    });
  } catch (e) {
    if (e.meta.cause === "Record to update not found.")
      return res.status(404).send({ error: "registro no encontrado" });
  }

  if (ordenesPendientes > 0)
    return res.status(403).send({
      error: "No puedes tomar mas ordenes, ya tienes una activa.",
    });
  next();
}

router.get(
  "/disponibles",
  //hasRole(roles.REPARTIDOR),
  validate(
    Joi.object({
      skip: Joi.number().integer().optional().default(0),
    }),
    "query"
  ),
  bloqueaSiTieneOrdenesPendientes,
  async (req, res) => {
    //if repartidor tiene ordenes sin entregar no puede tomar mas ordenes
    const ordenesADomicilioDisponibles = {
      estado: { in: [estadoorden.EN_PROCESO, estadoorden.RECIBIDA] },
      entrega: { is: null },
      domicilio: { not: undefined },
    };

    let numOrdenes;
    try { // <- Issue #45 del repo.
      const numOrdenes = await prisma.orden.count({
        where: ordenesADomicilioDisponibles,
      });
      if (numOrdenes == 0 || numOrdenes <= req.query.skip)
        return res
          .status(403)
          .send({ orden: null, error: "No hay mas ordenes disponibles" });
      skip = (req.user.idusuario + req.query.skip) % numOrdenes;
      orden = await prisma.orden.findFirst({
        where: ordenesADomicilioDisponibles,
        skip,
      });
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
        return res.status(404).send({ error: "registro no encontrado" });
    }

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
  bloqueaSiTieneOrdenesPendientes,
  async (req, res) => {

    let count;
    try { // <- Issue #45 del repo.
      const count = await prisma.orden.count({
        where: {
          estado: { in: [estadoorden.EN_PROCESO, estadoorden.RECIBIDA] },
          idorden: req.params.id,
          entrega: { is: null },
          domicilio: { not: undefined },
        },
      });
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
        return res.status(404).send({ error: "registro no encontrado" });
    }

    if (count == 0) return res.send({ error: "orden no disponible" });

    let repartidor, entrega;
    try { // <- Issue #45 del repo.
      const repartidor = await prisma.repartidor.findFirst({
        where: { idusuario: req.user.idusuario },
      });
      const entrega = await prisma.entregadomicilio.create({
        data: {
          idrepartidor: repartidor.idrepartidor,
          idorden: req.params.id,
        },
      });
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
        return res.status(404).send({ error: "registro no encontrado" });
    }

    res.send({ entrega });
  }
);

router.post(
  "/:id/estado",
  validate(
    Joi.object({
      id: Joi.number().integer(),
    }),
    "params"
  ),
  validate(
    Joi.object({
      estado: Joi.string().valid(...Object.values(estadoorden)),
    })
  ),
  async (req, res) => {

    let orden;
    try { // <- Issue #45 del repo.
      const orden = await prisma.orden.update({
        where: { idorden: req.params.id },
        data: { estado: req.body.estado },
      });
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
        return res.status(404).send({ error: "registro no encontrado" });
    }

    res.json(orden);
  }
);

router.get(
  "/pendiente",
  //hasRole(roles.REPARTIDOR),
  async (req, res) => {

    let repartidor, orden;
    try { // <- Issue #45 del repo.
      const repartidor = await prisma.repartidor.findFirst({
        where: { idusuario: req.user.idusuario },
      });
      const orden = await prisma.entregadomicilio.findFirst({
        where: {
          idrepartidor: repartidor.idrepartidor,
          orden: {
            estado: { not: estadoorden.ENTREGADA },
          },
        },
        include: {
          orden: true,
        },
      });
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
        return res.status(404).send({ error: "registro no encontrado" });
    }

    res.json(orden);
  }
);

/**
 * POST orden/ crea una nueva orden a partir del contenido de un carrito
 */
router.post(
  "/",
  validate(
    Joi.object({
      idcarrito: Joi.number().required(),
      metodopago: Joi.string().required(),
    }),
    "body"
  ),
  async (req, res) => {
    const { idcarrito, metodopago } = req.body;
    //Checamos si existe el carrito con el ID dado.

    let carrito;
    try { // <- Issue #45 del repo.
      const carrito = await prisma.carrito.findFirst({
        where: {
          idcarrito: idcarrito,
        },
      });
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
        return res.status(404).send({ error: "registro no encontrado" });
    }

    if (!carrito) {
      return res.status(404).json({
        message: "No existe el carrito con el ID dado.",
      });
    }

    let contenidoCarrito, ordenNormal, ordenEnvio, contenidoOrden, confirmacionCarrito;
    try { // <- Issue #45 del repo.

      // Consultamos el contenido del carrito.
      const contenidoCarrito = await prisma.contenidoCarrito.findMany({
        where: {
          idcarrito: idcarrito,
        },
        select: {
          idplatillo: true,
        },
      });

      // Creamos la orden normal.
      const ordenNormal = await prisma.ordennormal.create({
        data: {
          costo: carrito.costo,
          estado: "EN_PROCESO",
        },
      });
      // Creamos la orden de envio.
      const ordenEnvio = await prisma.ordenenvio.create({
        data: {
          costo: carrito.costo,
        },
      });

      // creamos el contenido de la orden.
      const contenidoOrden = await prisma.contenidoorden.createMany({
        data: contenidoCarrito.map((obj) => ({
          ...obj,
          idordennormal: ordenNormal.idordennormal,
          idordenenvio: ordenEnvio.idordenenvio,
        })),
      });

      // Creamos la confirmacion de carrito.
      console.log("el problema esta en la cofinmacion de carrito");
      const confirmacionCarrito = await prisma.confirmacionCarrito.create({
        data: {
          metodopago: metodopago,
          idcarrito: parseInt(carrito.idcarrito),
          idordenenvio: ordenEnvio.idordenenvio,
          idordennormal: ordenNormal.idordennormal,
        },
      });
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
        return res.status(404).send({ error: "registro no encontrado" });
    }
    
    res.json(confirmacionCarrito);
  }
);

module.exports = router;
