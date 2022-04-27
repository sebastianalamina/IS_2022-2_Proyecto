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
 * Observaciones: No se solicita el id del restaurante,
 *                ¿Por default se debe incrementar?
 *                Hace falta pedir el numero en el formulario
 */
router.post( // post es para escribir, get para solicitar
  "/",
  validate(
      Joi.object({ // Con los datos de la base de datos a dia de hoy 6/04
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
		idfranquicia: 1,
		...req.body, // info checada en Joi
	    },
	  });

      res.status(301).json(restaurante);
  }
);


router.get(
	"/",
	validate(
		Joi.object({
			idrestaurante : Joi.number().integer(),
		}),
		"query"
	),
	async (req,res)=>{
		if (Object.keys(req.query).length === 0){
			console.log("query vacio");
			const restaurante = await prisma.restaurante.findMany();
			res.json(restaurante)
		}else{
			console.log("query no vacio");
			console.log(JSON.stringify(req.query))
			const restaurante = await prisma.restaurante.findFirst({
				where : {
					...req.query
				}
			});	
			res.json(restaurante);
		}	
	}
)

module.exports = router;
