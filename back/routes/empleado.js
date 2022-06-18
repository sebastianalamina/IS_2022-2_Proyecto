// Enrutamiento mediante Express.
const roles = require("../utils/constants/roles");
const express = require("express");
const router = express.Router();

// Comunicación con la BD mediante Prisma.
const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

// Validación de parámetros mediante Joi.
const Joi = require("joi");

// Middleware.
const validate = require('../utils/middleware/validate');
const { bearerAuth, esAdministrador } = require("../utils/middleware/auth");

router.post("/",
	// esAdministrador,
	bearerAuth,
	validate(
		Joi.object({
			email : Joi.string().email().required(),
			rol : Joi.string().lowercase().required(),
		}),
		"body"
	),
	async (req, res) => {
		const { idrestaurante } = req.params;
		const { email ,rol} = req.body;

		// Obtenemos el id del administrador
		console.log("id usuario del que esta haciendo la solicitud es : ",req.user.idusuario)

		let idAdministrador;
		try {  // <- Issue #45 del repo.
			idAdministrador = await prisma.administrador.findFirst({
				where:{
					idusuario : req.user.idusuario
				},	
			});
		} catch (e) {
		  if (e.meta.cause === "Record to update not found.")
			  return res.status(404).send({ error: "registro no encontrado" });
		}

		if (rol === roles.MESERO) {
			let mesero;
			try{
			// Creamos un nuevo perfil de mesero
			mesero = await prisma.mesero.create({
					data:{
					restaurante : { connect : { idrestaurante: idAdministrador.idrestaurante } },
					administrador : { connect : { idadmin : idAdministrador.idadmin } },
					usuario:{ connect : { email : email } },
					restaurante : { connect : { idrestaurante : idAdministrador.idrestaurante } }
					}
				});
				res.json(mesero)
			} catch(e){
				if (e.code == "P2002")
					return res.status(400).send({error : "Este empleado ya fue asignado a algún restaurante."});

				if(e.meta.cause === "No 'usuario' record(s) (needed to inline the relation on 'mesero' record(s)) was found for a nested connect on one-to-many relation 'meseroTousuario'.")
					return res.status(400).send({error : "El usuario no existe"});

				if (e.meta.cause === "Record to update not found.")
					return res.status(404).send({ error: "registro no encontrado" });

				return res.status(400).send({error : e});
			}
		} else if(rol === roles.REPARTIDOR){
			// TODO Creo que esto ya no es necesario

			let repartidor;
			try {  // <- Issue #45 del repo.
			repartidor = await prisma.repartidor.create({
				data:{
					usuario : {
						connectOrCreate:{
							where:{ email, },
							create : { ...req.body }
						}
					}
				}});
			} catch (e) {
			  if (e.meta.cause === "Record to update not found.")
				  return res.status(404).send({ error: "registro no encontrado" });
			}

			res.json(repartidor)
		}
});





/* Este GET no requiere nada y devuelve a
todos los empleados en formato JSON. */
router.get(
	'/',
	esAdministrador,
	bearerAuth,
	async (req, res) => {	

		let idAdministrador;
		try {
			idAdministrador = await prisma.administrador.findFirst({
				where : {
					idusuario : req.user.idusuario
				}
			});
		} catch (e) {
			if (e.meta.cause === "Record to update not found.")
				return res.status(404).send({ error: "registro no encontrado" });
		}

		let empleados = {};

		try {
			empleados["meseros"] = await prisma.mesero.findMany({
				where:{
					idadmin : idAdministrador.idadmin,
				},
				select : {
					usuario : {
						select :{
							email : true,
							nombre : true,
							apatermo : true,
							amaterno : true,
							confirmado : true,
							idusuario : true
						}
					}
				}
			});
		} catch (e) {
			if (e.meta.cause === "Record to update not found.")
				return res.status(404).send({ error: "registro no encontrado" });
		}
	
		res.json(empleados)
	}
);

router.delete("/mesero",
	esAdministrador,
	validate(
		Joi.object({
			idusuario : Joi.number().integer(),
		}),
		"query"
	),
	async (req,res)=>{
		const {idusuario} = req.query;
		console.log("id usuario", idusuario)

		let usuarioeliminado;
		try {
			usuarioeliminado = await prisma.mesero.delete({
				where:{
					idusuario : idusuario
				}
			});
		} catch (e) {
			if (e.meta.cause === "Record to update not found.")
				return res.status(404).send({ error: "registro no encontrado" });
		}

		console.log("datos del usuario eliminado :",JSON.stringify(usuarioeliminado));
		res.status(202).send("Empleado borrado");

	}
);

// Incluimos el "router" dentro de lo
// que este archivo ha de exportar.
module.exports = router;