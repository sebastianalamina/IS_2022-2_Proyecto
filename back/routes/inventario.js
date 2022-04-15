const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();
const validate = require('../utils/middleware/validate')

router.post('/', validate(
   Joi.object({
id_restaurante:Joi.string().required(),
nombre: Joi.string().required(),
cantidad: Joi.number().integer().required()
   }),parametertsLocation="body" ),
   async (req,res)=>{
      // Checking if id_restaurante its valid
      const userCount = await prisma.restaurante.count({
      where: { idrestaurante: req.body.id_restaurante },
      });
      if (!userCount) {
         return res.status(400).json({
         error: "The restaurant ID is invalid.",
         });
      }
      console.log(req.body.id_restaurante);
      // If its valid insert the new item to the table Inventario
      const itemCount = await prisma.inventario.count({
         where:{
            nombre : req.body.nombre,
            idrestaurante : req.body.id_restaurante
         }
      });
      if (itemCount){
         console.log('Updating the entry for that element')
         const repeatedItem = await prisma.inventario.findFirst({
            where:{
               nombre : req.body.nombre,
               idrestaurante : req.body.id_restaurante
            },
         });
         console.log(repeatedItem.idinventario)
         console.log(repeatedItem.cantidad)
         const item = await prisma.inventario.update({
            where:{
               idinventario: repeatedItem.idinventario
            },
            data: {
               cantidad :req.body.cantidad
            }
         });
         console.log(item.idinventario)
         console.log('updated element')
         console.log(item.cantidad)
         return res.status(201).json(item);
      }
      const item = await prisma.inventario.create({
         data: {
            idrestaurante : req.body.id_restaurante,
            cantidad : req.body.cantidad,
            nombre : req.body.nombre
         }, 
      });
      return res.status(201).json(item);

   }
);

router.get('/',validate(
   Joi.object({
      id_restaurante: Joi.string().required()
   }),
   parametertsLocation="query"
),async (req,res)=>{
      // Checking
      const userCount = await prisma.restaurante.count({
      where: { idrestaurante: req.query.id_restaurante },
      });

      if (!userCount) {
         return res.status(400).json({
         error: "The restaurant ID is invalid.",
         });
      }
      const inventario = await prisma.inventario.findMany({
         where:{
            idrestaurante: req.query.id_restaurante
         }
      })
      console.log('inventario valido');
      return res.json(inventario);
});

module.exports = router;