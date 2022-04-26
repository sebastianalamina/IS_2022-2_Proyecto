/**
 * Archivo que crea la ruta restaurant-signup
 */

const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();
const validate = require("../utils/middleware/validate");
const { json } = require("express");

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
	"",
	async (req,res)=>{
		console.log("ruta vacia ");
		const restaurante = await prisma.restaurante.findMany();
		res.json(restaurante);
	}
)

router.get(
	"/",
	validate(
		Joi.object({
			idrestaurante : Joi.number().integer(),
		})
		,
	),
	async (req,res)=>{
		console.log("ruta no vacia");
		const restaurante = await prisma.restaurante.findFirst({
			where : {
				...req.query
			}
		});

		console.log(JSON.stringify(req.query))
		
		res.json(restaurante);
	}
)

module.exports = router;
