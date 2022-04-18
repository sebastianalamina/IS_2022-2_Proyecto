/**
 * Archivo que crea la ruta restaurant-signup
 */

const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();
const validate = require("../utils/middleware/validate");

/**
 * @swagger
 * restaurant-signup:
 *   post:
 *     summary: Registra y regresa un restaurante.
 */
router.post( 
  "/signup",
  validate(
      Joi.object({ 
	  nombre: Joi.string().required(),
	  estado: Joi.string().required(),
	  calle:  Joi.string().required(),
	  numero: Joi.number().required(),  
	  cp:     Joi.number().required(),
	  municipio:   Joi.string().required(),
      })
  ),
  async (req, res)=> {
      const restaurante = await prisma.restaurante.create(
	  {
	      data: {
		  ...req.body,
		  idfranquicia: 1
	      },
	  }
      );

      return res.status(201).json(restaurante);
	  }
);

module.exports = router;
