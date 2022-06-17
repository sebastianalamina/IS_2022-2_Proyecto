const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();
const validate = require("../utils/middleware/validate");

const { hasRole, esAdministrador, bearerAuth } = require("../utils/middleware/auth");
const { estaAutenticado } = require("../utils/middleware/auth");
const { get } = require("./restaurante");

//@ts-check

router.get(
  "/:idrestaurante",
  //estaAutenticado,
  validate(
    Joi.object({
      idrestaurante : Joi.number()
    }),
    "params"
  ),
  validate(
    Joi.object({
      skip: Joi.number().integer().min(0).optional().default(0),
      take: Joi.number().integer().min(1).optional().default(20),
    }),
    "query"
  ),
  async (req, res) => {
    const { skip, take } = req.query;

    let menu;
    try {  // <- Issue #45 del repo.
      menu = await prisma.platillo.findMany({
        where: {
          idrestaurante : req.params.idrestaurante
        },
        skip,
        take,
      });
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
        return res.status(404).send({ error: "registro no encontrado" });
    }

    res.status(200).json(menu);
  }
)


router.get(
  "/",
  //estaAutenticado,
  validate(
    Joi.object({
      skip: Joi.number().integer().min(0),
      take: Joi.number().integer().min(1),
    }),
    "query"
  ),
  async (req, res) => {
    const { skip, take } = req.query;

    let menu;
    try {  // <- Issue #45 del repo.
      menu = await prisma.menu.findMany({
        skip,
        take,
      });
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
        return res.status(404).send({ error: "registro no encontrado" });
    }

    res.json(menu);

  });

/**
 * Permite agregar un platillo a la base de datos dado el id de restaurnate
 */
router.post(
  "/", 
  esAdministrador,
  validate(
    Joi.object({
      idrestaurante: Joi.number().required(),
      nombrePlatillo : Joi.string(),
      costoPlatillo : Joi.number(),
      imgPlatillo : Joi.string(), 
    }),
    "body"
  ),
  async (req, res) => {
    const {idrestaurante, nombrePlatillo, costoPlatillo, imgPlatillo} = req.body

    let idmenu, platilloCreado;
    try {  // <- Issue #45 del repo.
      idmenu = await prisma.menu.findFirst({
        where:{
          idrestaurante : idrestaurante
        }
      });
      platilloCreado = await prisma.platillo.create({
        data:{
          idrestaurante : idrestaurante,
          idmenu : idmenu.idmenu,
          nombre : nombrePlatillo,
          costo : costoPlatillo,
          img : imgPlatillo ,
        }
      });
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
        return res.status(404).send({ error: "registro no encontrado" });
    }

    res.status(201).json(platilloCreado);
  }
);

/**
 * 
 */
router.get("/administrador",
  esAdministrador,
  bearerAuth,
  async (req,res)=>{

    let administradorInfo;
    try {  // <- Issue #45 del repo.
      administradorInfo = await prisma.administrador.findFirst({
        where:{
          idusuario : req.user.idusuario,
        },
        select : {
          restaurante : {
            select: {
              idrestaurante : true,
              menu : {
                select :{
                  idmenu : true
                }
              }
            }
          }
        } 
      });
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
        return res.status(404).send({ error: "registro no encontrado" });
    }

    res.json(administradorInfo);
  }
);
module.exports = router;
