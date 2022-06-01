const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();
const validate = require("../utils/middleware/validate");
const { esAdministrador ,bearerAuth } = require("../utils/middleware/auth");
const { valid } = require("joi");


/**
 * Esta ruta es para recibir un resumen de la informacion de un restaurante
 * @swagger
 * 
 */
router.get("/restaurante",
    esAdministrador,
    bearerAuth,
    async (req, res) => {
        // Revisamos que el administrador tenga permisos de revisar la informacion de ese restaurante
        const administrador = await prisma.administrador.findFirst({
            where:{
                idusuario : req.user.idusuario
            },
            select:{
                idadmin : true,
                idrestaurante : true
            }
        });
        if( administrador.idrestaurante ){
            // Recabamos la informacion
            const info = await prisma.restaurante.findFirst({
                where:{
                    idrestaurante : administrador.idrestaurante
                },
                include:{
                    _count:{
                        select:{
                            mesero : true,
                            
                        }
                    },
                    menu:{
                        select:{
                            _count:{
                                select:{
                                    platillo: true
                                }
                            }
                        }
                    }
                }
            })
            res.json(info);

        }else{
            res.status(400);
        }
        
    }
);


module.exports = router;