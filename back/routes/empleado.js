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

/* Este GET no requiere nada y devuelve a
todos los empleados en formato JSON. */
router.get(
	'/',
	async (req, res) => {

		let tablas_a_buscar = ['administrador', 'cocinero', 'mesero', 'repartidor']
		// let ids_a_buscar = ['idadmin', 'idcocinero', 'idmesero', 'idrepartidor']
		let json_a_devolver = {}

		// Recopilamos a los empleados de la BD...
		for (var i = 0; i < tablas_a_buscar.length; i++) {
			tabla_actual = tablas_a_buscar.at(i)
			json_a_devolver[tabla_actual] = await prisma.tabla_actual.findMany()
		}

		// Debug temporal:
		console.log(json_a_devolver)
		return res.status(201).json(json_a_devolver);
	}
);

// Incluimos el "router" dentro de lo
// que este archivo ha de exportar.
module.exports = router;