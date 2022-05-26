// Enrutamiento mediante Express.
const express = require("express");
const router = express.Router();

// Comunicación con la BD mediante Prisma.
const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

// Validación de parámetros mediante Joi.
const Joi = require("joi");

// Middleware.
const validate = require('../utils/middleware/validate');

/*
Este GET devuelve todas las mesas del restaurante dado.
*/
router.get(
	'/',
	validate(Joi.object({
		id_restaurante: Joi.number().integer().required(),
	}), "query"),
	async (req, res) => {

		// Almacenamos las variables pasadas como parámetros.
		let id_restaurante = req.query.id_restaurante;

		// Buscamos las mesas de dicho restaurante.
		let mesas = await prisma.mesa.findMany({
			where:{
				idrestaurante: id_restaurante,
			},
		});

		res.json(mesas);
		
	}
);

/*
Este POST cambia el booleano "ocupada" de la mesa dada.
*/
router.post(
	'/',
	validate(Joi.object({
		idmesa: Joi.number().integer().required(),
		ocupada: Joi.boolean().required(),
	}), ),
	async (req, res) => {

		let idmesa = req.body.idmesa;
		let ocupada = req.body.ocupada;
		const mesa = await prisma.mesa.update({
			where: {
				idmesa: idmesa,
			},
			data: {
				ocupada: ocupada,
			}
		});
		res.json(mesa);

	}
);

// Incluimos el "router" dentro de lo
// que este archivo ha de exportar.
module.exports = router;