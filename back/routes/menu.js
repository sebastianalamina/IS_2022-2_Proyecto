const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();

//@ts-check

router.get('/display', async function (req,res) {
  let id_restaurante = req.query.id_restaurant;
  const menu = await prisma.menu.findFirst({
    where: {
      idrestaurante: id_restaurante
    }
  })
  router.json(menu)  
});

module.exports = router;