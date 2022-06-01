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

		let json_a_devolver = {}

		// Recopilamos a los empleados de la BD...
		json_a_devolver['administrador'] = await prisma.administrador.findMany();
		json_a_devolver['mesero'] = await prisma.mesero.findMany();
		json_a_devolver['repartidor'] = await prisma.repartidor.findMany();

		// Obtenemos las instancias correspondientes de la tabla 'Usuario'.
		// Para mandar más información sobre cada empleado.
		for (llave in json_a_devolver) {
			let lista_empleados = json_a_devolver[llave]
			for (let i = 0; i < lista_empleados.length; i++) {
				let empleado = lista_empleados[i]
				let instancia_usuario = await prisma.usuario.findFirst({
					where: { idusuario : empleado.idusuario }
				});
				for (columna_usuario in instancia_usuario)
					empleado[columna_usuario] = instancia_usuario[columna_usuario]
			}
		}

		return res.status(201).json(json_a_devolver);
	}
);

// Incluimos el "router" dentro de lo
// que este archivo ha de exportar.
module.exports = router;