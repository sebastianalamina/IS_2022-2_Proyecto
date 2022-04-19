/**
 * Archivo que crea la ruta restaurant-signup
 */

const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();

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
  "/restaurant-signup",
  validate(
      Joi.object({ // Con los datos de la base de datos a dia de hoy 6/04
	  nombre: Joi.string().required(),
	  estado: Joi.string().required(),
	  calle:  Joi.string().required(),
	  numero: Joi.number().required(),  
	  cp:     Joi.number().required(),
	  muni:   Joi.string().required(),
      })
  ),
  async (req, res) => {
      const restaurante = await.prisma.restaurante.create(
	  {
	      data: {
		  ...req.body, // info checada en Joi
	      },
	  }
      );

      return.status(201).json(restaurante);
  }
);

module.exports = router;
