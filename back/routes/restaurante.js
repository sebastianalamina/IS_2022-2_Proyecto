/**
 * Archivo que crea la ruta restaurant-signup
 */

const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();
const validate = require("../utils/middleware/validate");
const { hasRole } = require("../utils/middleware/auth")

/**
 * @swagger
 * /auth/restaurant-signup:
 *   post:
 *     summary: Registra y regresa un restaurante.
 *
 */
router.post(
  "/",
  hasRole(["ADMIN"]),
  validate(
      Joi.object({ 
	  nombre: Joi.string().required(),
	  estado: Joi.string().required(),
	  calle:  Joi.string().required(),
	  numero: Joi.number().required(),  
	  cp:     Joi.number().required(),
	  municipio:  Joi.string().required(),
      })
  ),
  async (req, res) => {
      const restaurante = await prisma.restaurante.create(
	  {
	    data: {
		...req.body, // info checada en Joi
	    },
	  });

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
			skip : Joi.number().integer().min(0).default(0),
			take : Joi.number().integer().min(1).default(10),
		}), "query"),
	async (req,res)=>{
		const {skip,take} = req.query;
		const restaurante = await prisma.restaurante.findMany({
			skip,
			take,
		});

		res.json(restaurante)			
	}
)

module.exports = router;
