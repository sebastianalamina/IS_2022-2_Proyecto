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
        // Revisamos que el administrador tenga permisos de revisar la informacion de ese restaurante
        console.log("id del suuari", req.user.idusuario)

        const administrador = await prisma.administrador.findFirst({
            where:{
                idusuario: req.user.idusuario,
            },
            select:{
                idusuario: true,
                idrestaurante: true
            }
        }) 

        console.log(administrador)

        if( administrador.idrestaurante ){
            // Recabamos la informacionj
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
                });
                res.json(info)
        }if(!administrador.idrestaurante){ 
            res.status(404).json({"message" : "El administrador no existe"});
       }        
    }
);

// Esta ruta nos permite saber cuantas han sido las ordenes que se han pagado hasta ahora en el restaurante.

router.get("/corte-caja",
    esAdministrador,
    bearerAuth,
    async (req,res)=>{
        // Revisamos que el administrador tenga permisos de revisar la informacion de ese restaurante
        let administrador;
        try { // <- Issue #45 del repo.
            console.log("el id del usuario es", req.user.idusuario);
            administrador = await prisma.administrador.findFirst({
                where:{
                    idusuario : req.user.idusuario
                },
                select:{
                    idadmin : true,
                    idrestaurante : true
                }
            });
        } catch (e) {
            if (e.meta.cause === "Record to update not found.")
                res.status(404).send({ error: "registro no encontrado" });
        }
        if(administrador.idrestaurante){

        }

    });


module.exports = router;