const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();
const validate = require("../utils/middleware/validate");

router.post(
  "/",
  validate(
    Joi.object({
      id_restaurante: Joi.number().integer().required(),
      nombre: Joi.number().integer().required(),
      cantidad: Joi.number().integer().required(),
    }),
    "body"
  ),
  async (req, res) => {
    // Checking if id_restaurante its valid

    let userCount;
    try { // <- Issue #45 del repo.
      const userCount = await prisma.restaurante.count({
        where: { idrestaurante: req.body.id_restaurante },
      });
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
        return res.status(404).send({ error: "registro no encontrado" });
    }

    if (!userCount) {
      return res.status(400).json({
        error: "The restaurant ID is invalid.",
      });
    }
    console.log(req.body.id_restaurante);
    // If its valid insert the new item to the table Inventario

    let itemCount;
    try { // <- Issue #45 del repo.
      const itemCount = await prisma.inventario.count({
        where: {
          nombre: req.body.nombre,
          idrestaurante: req.body.id_restaurante,
        },
      });
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
        return res.status(404).send({ error: "registro no encontrado" });
    }

    if (itemCount) {
      console.log("Updating the entry for that element");

      let repeatedItem;
      try { // <- Issue #45 del repo.
        const repeatedItem = await prisma.inventario.findFirst({
          where: {
            nombre: req.body.nombre,
            idrestaurante: req.body.id_restaurante,
          },
        });
      } catch (e) {
        if (e.meta.cause === "Record to update not found.")
          return res.status(404).send({ error: "registro no encontrado" });
      }

      console.log(repeatedItem.idinventario);
      console.log(repeatedItem.cantidad);

      let item;
      try { // <- Issue #45 del repo.
        const item = await prisma.inventario.update({
          where: {
            idinventario: repeatedItem.idinventario,
          },
          data: {
            cantidad: req.body.cantidad,
          },
        });
      } catch (e) {
        if (e.meta.cause === "Record to update not found.")
          return res.status(404).send({ error: "registro no encontrado" });
      }

      console.log(item.idinventario);
      console.log("updated element");
      console.log(item.cantidad);
      return res.status(201).json(item);
    }

    let item;
    try { // <- Issue #45 del repo.
      const item = await prisma.inventario.create({
        data: {
          idrestaurante: req.body.id_restaurante,
          cantidad: req.body.cantidad,
          nombre: req.body.nombre,
        },
      });
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
        return res.status(404).send({ error: "registro no encontrado" });
    }

    return res.status(201).json(item);
  }
);


router.get(
  "/",
  validate(
    Joi.object({
      id_restaurante: Joi.number().required(),
    }),
    (parametertsLocation = "query")
  ),
  async (req, res) => {
    // Checking

    let userCount;
    try { // <- Issue #45 del repo.
      const userCount = await prisma.restaurante.count({
        where: { idrestaurante: req.query.id_restaurante },
      });
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
        return res.status(404).send({ error: "registro no encontrado" });
    }

    if (!userCount) {
      return res.status(400).json({
        error: "The restaurant ID is invalid.",
      });
    }

    let inventario;
    try { // <- Issue #45 del repo.
      const inventario = await prisma.inventario.findMany({
        where: {
          idrestaurante: req.query.id_restaurante,
        },
      });
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
        return res.status(404).send({ error: "registro no encontrado" });
    }
    
    console.log("inventario valido");
    return res.json(inventario);
  }
);

module.exports = router;
