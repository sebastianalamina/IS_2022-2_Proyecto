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

/* Este GET requiere el ID de la orden ("identregadomicilio" o
"identregamesa"), un booleano para determinar si es entrega
a domicilio (tabla "entregadomicilio") o entrega en mesa
(tabla "entregamesa"), y devuelve la instancia correspondiente
en formato JSON (lo cual contiene el estado de la orden). */
router.get(
	'/',
	validate(Joi.object({
		id_entrega: Joi.number().integer().required(),
		es_domicilio: Joi.boolean().required(),
	}), "query"),
	async (req, res) => {

		// Almacenamos las variables pasadas como parámetros.
		let id_entrega = req.query.id_entrega;
		let es_domicilio = req.query.es_domicilio;

		// La tabla en la que Prisma buscará depende del tipo de orden.
		let tabla_a_buscar = es_domicilio ? 'entregadomicilio' : 'entregamesa';
		let id_a_buscar = es_domicilio ? 'identregadomicilio' : 'identregamesa';

		// Verificamos que la orden se encuentre en la BD...
		const id_entrega_count = await prisma.tabla_a_buscar.count({
			where: { id_a_buscar: id_entrega },
		});

		// ...Si no, devolvemos el error correspondiente.
		if (!id_entrega_count) {
			return res.status(400).json({
				error: `La tabla ${tabla_a_buscar} no contiene instancia de ID ${id_a_buscar} igual a ${id_entrega}`,
			});
		}

		// ...Si sí, recuperamos la instancia correspondiente.
		const orden = await prisma.tabla_a_buscar.findFirst({
			where: { id_a_buscar: id_entrega }
		});

		// Debug temporal:
		console.log(orden)
		res.json(orden);
	}
);

/* Este POST requiere el ID de la orden ("identregadomicilio" o
"identregamesa"), un booleano para determinar si es entrega
a domicilio (tabla "entregadomicilio") o entrega en mesa
(tabla "entregamesa"), el nuevo estado que se le aplicará
a la orden, y actualiza el estado de dicha orden. Devuelve
la nueva instancia en formato JSON. */
router.post(
	'/',
	validate(Joi.object({
		id_entrega: Joi.number().integer().required(),
		es_domicilio: Joi.boolean().required(),
		nuevo_estado: Joi.number()
			.integer()
			.min(0)
			.max(3),
	}), "query"),
	async (req, res) => {

		// Almacenamos las variables pasadas como parámetros.
		let id_entrega = req.query.id_entrega;
		let es_domicilio = req.query.es_domicilio;
		let nuevo_estado = req.query.nuevo_estado;

		// La tabla en la que Prisma buscará depende del tipo de orden.
		let tabla_a_buscar = es_domicilio ? 'entregadomicilio' : 'entregamesa';
		let id_a_buscar = es_domicilio ? 'identregadomicilio' : 'identregamesa';

		// Verificamos que la orden se encuentre en la BD...
		const id_entrega_count = await prisma.tabla_a_buscar.count({
			where: { id_a_buscar: id_entrega },
		});

		// ...Si no, devolvemos el error correspondiente.
		if (!id_entrega_count) {
			return res.status(400).json({
				error: `La tabla ${tabla_a_buscar} no contiene instancia de ID ${id_a_buscar} igual a ${id_entrega}`,
			});
		}

		// ...Si sí, actualizamos la instancia correspondiente.
		const orden_a_modificar = await prisma.tabla_a_buscar.update({
			where: { id_a_buscar: id_entrega },
			data: { estado: nuevo_estado }
		});

		// Debug temporal:
		console.log(orden_a_modificar)
		return res.status(201).json(orden_a_modificar);
	}
);

// Incluimos el "router" dentro de lo
// que este archivo ha de exportar.
module.exports = router;