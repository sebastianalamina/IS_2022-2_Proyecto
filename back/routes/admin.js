const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();
const validate = require("../utils/middleware/validate");
const { esAdministrador ,bearerAuth } = require("../utils/middleware/auth");


/**
 * Esta ruta es para recibir un resumen de la informacion de un restaurante
 * @swagger
 * 
 */
router.get("/restaurante",
    esAdministrador,
    bearerAuth,
    async (req, res) => {
       console.log("el id del usuario es", req.user.idusuario);
       const administrador = await prisma.administrador.findFirst({
           where:{ idusuario: req.user.idusuario },  
       });

       if(!administrador){
            res.status(404).json({"message" : "El administrador no existe"});
       }else{
           const restaurante = await prisma.restaurante.findFirst({
               where:{ idrestaurante : administrador.idrestaurante, },
               include:{
                   _count: { select: { mesero: true } },
                    menu:{ select : { _count:{ select:{ platillo : true } } } },
               }
           });
           res.json(restaurante); 
       }
        
    }
);


module.exports = router;