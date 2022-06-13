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

  	let restaurante;
  	let menu;
  	try { // <- Issue #45 del repo.

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
			});
			// Inicializamos un menu vacio para el nuevo restaurante 
			const menu = await prisma.menu.create({
				data:{
					idrestaurante : restaurante.idrestaurante
				}
			});

		} catch (e) {
			if (e.meta.cause === "Record to update not found.")
				return res.status(404).send({ error: "registro no encontrado" });
		}

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

	  	let restaurante;
	  	try { // <- Issue #45 del repo.
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
			} catch (e) {
				if (e.meta.cause === "Record to update not found.")
					return res.status(404).send({ error: "registro no encontrado" });
			}

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

		let restaurante;
		try { // <- Issue #45 del repo.
			const restaurante = await prisma.restaurante.findMany({
				skip,
				take,	
			});
		} catch (e) {
			if (e.meta.cause === "Record to update not found.")
				return res.status(404).send({ error: "registro no encontrado" });
		}

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

		let restauranteEliminado;
		try { // <- Issue #45 del repo.
			const restauranteEliminado = await prisma.restaurante.delete({
				where:{ idrestaurante },
			});
		} catch (e) {
			if (e.meta.cause === "Record to update not found.")
				return res.status(404).send({ error: "registro no encontrado" });
		}
		
		res.json(restauranteEliminado);
	}
);

module.exports = router;
