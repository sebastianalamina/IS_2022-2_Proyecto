/**
 * Archivo que crea la ruta restaurant-signup
 */

const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();
const validate = require("../utils/middleware/validate");
const { esAdministrador ,bearerAuth } = require("../utils/middleware/auth");
const { valid } = require("joi");


/**
 * @swagger
 * /auth/restaurant-signup:
 *   post:
 *     summary: Registra y regresa un restaurante.
 *
 */
router.post(
  "/",
  esAdministrador,
  bearerAuth,
  validate(
      Joi.object({ 
	  nombre: Joi.string().required(),
	  estado: Joi.string().required(),
	  calle:  Joi.string().required(),
	  numero: Joi.number().required(),  
	  cp:     Joi.number().required(),
	  municipio:  Joi.string().required(),
      }),
	  "body"
  ),
  async (req, res) => {	

		// Creamos el nuevo restaurante. al mismo tiempo creamos el nuevo 
		const restaurante = await prisma.restaurante.create({
			data : {
				administrador : {
					connectOrCreate:{
						where : {
							idusuario : req.user.idusuario,
						},
						create : {
							idusuario : req.user.idusuario,
						}
					}
				},
				...req.body
			},
			select:{
				idrestaurante: true,
				nombre : true
			}	
		}) 
		// Inicializamos un menu vacio para el nuevo restaurante 
		const menu = await prisma.menu.create({
			data:{
				idrestaurante : restaurante.idrestaurante
			}
		})
      res.json(restaurante);
  }
);

/***
 * @swagger
 * /restaurante/:idrestaurante
 *  get: 
 * 		summary : Returns the restaurante with the given id
 * 
 */
router.get("/:idrestaurante",
  validate(
	  Joi.object({
		idrestaurante: Joi.number().integer().required(),
	  }),
	"params"),	
	  async (req, res) => {
		  const restaurante = await prisma.restaurante.findFirst({
			  where: {
				  idrestaurante: req.params.idrestaurante,
			  },
			  include:{
				  _count: {
					  select:{
						  resena : true
					  }
				  }
			  }
		  });
		  res.json(restaurante);
	  }
)


router.get(
	"/",
	validate(
		Joi.object({
			skip : Joi.number().integer().min(0).default(0).required(),
			take : Joi.number().integer().min(1).default(10).required(),
		}), "query"),
	async (req,res)=>{
		const {skip,take} = req.query;
		const restaurante = await prisma.restaurante.findMany({
			skip,
			take,	
		});
		res.json(restaurante)			
	}
);

router.delete("/",
	validate(
		Joi.object({ idrestaurante : Joi.number().required()}),
		"query"
	),
	async (req,res)=>{
		const {idrestaurante} = req.query
		const restauranteEliminado = await prisma.restaurante.delete({
			where:{ idrestaurante },
		})
		res.json(restauranteEliminado);
	}
);

module.exports = router;
