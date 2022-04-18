const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();
const validate = require('../utils/middleware/validate')

//@ts-check

router.get('/', validate(
  Joi.object({
    id_menu: Joi.number().integer().required()  , 
    id_restaurante: Joi.number().integer().required(),
    id_franquicia: Joi.number().integer().required()
  }), 
  "query"),
  async (req,res)=> {
  let id_restaurante = req.query.id_restaurante;
  let id_menu = req.query.id_menu;
  let id_franquicia = req.query.id_franquicia
  const platillo = await prisma.platillo.findMany({
    where: {
      idmenu: id_menu,
      idrestaurante: id_restaurante,
      idfranquicia: id_franquicia
    }
  });
  console.log(platillo) 
  res.json(platillo)  
});



module.exports = router;
