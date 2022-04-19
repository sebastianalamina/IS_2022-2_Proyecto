const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();

router.get('/display', async (req, res) => {
    let id_cliente = req.query.id_cliente;
    const id_carrito = await prisma.modificarCarrito.findFirst({
        where: { idcliente: id_cliente}
    })
    const contenido = await prisma.contenidoCarrito.findMany({
        where: {idcarrito: id_carrito}
    })
    console.log(contenido)
    res.json(contenido)
  });

  module.exports = router;