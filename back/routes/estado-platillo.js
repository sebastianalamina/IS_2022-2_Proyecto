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

/* Este GET requiere el ID de la orden, y devuelve la instancia correspondiente
en formato JSON (lo cual contiene el estado de la orden). */
router.get(
	'/',
	validate(Joi.object({
		id_orden: Joi.number().integer().required(),
	}), "query"),
	async (req, res) => {

		// Almacenamos las variables pasadas como parámetros.
		let id_orden = req.query.id_orden;

		// Verificamos que la orden se encuentre en la BD...
		let id_entrega_count;
		try {
			id_entrega_count = await prisma.orden.count({
				where: { idorden : id_orden },
			});
		} catch (e) {
			if (e.meta.cause === "Record to update not found.")
				return res.status(404).send({ error: "registro no encontrado" });
		}

		// ...Si no, devolvemos el error correspondiente.
		if (!id_entrega_count)
			return res.status(400).json({
				error: `La tabla 'orden' no contiene instancia de ID ${id_orden}.`,
			});

		// ...Si sí, recuperamos la instancia correspondiente.
		let orden;
		try {
			orden = await prisma.orden.findFirst({
				where: { idorden : id_orden }
			});
		} catch (e) {
			if (e.meta.cause === "Record to update not found.")
				return res.status(404).send({ error: "registro no encontrado" });
		}

		// Debug temporal:
		console.log(orden);
		return res.status(201).json(orden);
	}
);

/* Este POST requiere el ID de la orden, el nuevo estado que se le aplicará
a la orden, y actualiza el estado de dicha orden. Devuelve
la nueva instancia en formato JSON. */
router.post(
	'/',
	validate(Joi.object({
		id_orden: Joi.number().integer().required(),
		nuevo_estado: Joi.number().integer()
			.required()
			.min(0)
			.max(3),
	}), "query"),
	async (req, res) => {

		// Almacenamos las variables pasadas como parámetros.
		let id_orden = req.query.id_orden;
		let nuevo_estado = req.query.nuevo_estado;

		// Verificamos que la orden se encuentre en la BD...
		let id_entrega_count;
		try {
			id_entrega_count = await prisma.orden.count({
				where: { idorden : id_orden },
			});
		} catch (e) {
			if (e.meta.cause === "Record to update not found.")
				return res.status(404).send({ error: "registro no encontrado" });
		}

		// ...Si no, devolvemos el error correspondiente.
		if (!id_entrega_count)
			return res.status(400).json({
				error: `La tabla 'orden' no contiene instancia de ID ${id_orden}.`,
			});

		// Convertimos el nuevo estado (valor entre 0 y 3) a cadena.
		let estados_posibles = ["RECIBIDA","EN_PROCESO","EN_CAMINO","ENTREGADA"]
		nuevo_estado = estados_posibles[nuevo_estado]

		// Actualizamos la instancia correspondiente.
		let orden_a_modificar;
		try {
			orden_a_modificar = await prisma.orden.update({
				where: { idorden : id_orden },
				data: { estado : nuevo_estado }
			});
		} catch (e) {
			if (e.meta.cause === "Record to update not found.")
				return res.status(404).send({ error: "registro no encontrado" });
		}

		// Debug temporal:
		console.log(orden_a_modificar);
		return res.status(201).json(orden_a_modificar);
	}
);

// Incluimos el "router" dentro de lo
// que este archivo ha de exportar.
module.exports = router;