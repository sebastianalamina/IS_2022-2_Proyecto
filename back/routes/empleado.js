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
const { bearerAuth, esAdministrador } = require("../utils/middleware/auth");

router.post("/",
	esAdministrador,
	bearerAuth,
	validate(
		Joi.object({
			email : Joi.string().email().required(),
			rol : Joi.string().required(),
		}),
		"body"
	),
	async (req, res) => {
		const { idrestaurante } = req.params;
		const { email ,rol} = req.body;

		// Obtenemos el id del administrador
		console.log("id usuario del que esta haciendo la solicitud es : ",req.user.idusuario)
		const idAdministrador = await prisma.administrador.findFirst({
			where:{
				idusuario : req.user.idusuario
			},	
		});


		if (rol === "MESERO"){

			// Creamos un nuevo perfil de mesero 
			const mesero = await prisma.mesero.create({
				data:{
					idrestaurante : idrestaurante,
					administrador : {
						connect : {
							idadmin : idAdministrador.idadmin
						}
					},
					usuario:{
						connect : { email : email }
					},
					restaurante : {
						connect : {
							idrestaurante : idAdministrador.idrestaurante
						}
					}
				}
			});

			res.json(mesero)
		} else if(rol == "REPARTIDOR"){
			const repartidor = await prisma.repartidor.create({
				data:{
					usuario : {
						connectOrCreate:{
							where:{
								email,
							},
							create : {
								...req.body
							}
						}
					}
				}	
			});
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

		const idAdministrador = await prisma.administrador.findFirst({
			where : {
				idusuario : req.user.idusuario
			}
		})
		let empleados = {};

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
		const usuarioeliminado = await prisma.mesero.delete({
			where:{
				idusuario : idusuario
			}
		});
		console.log("datos del usuario eliminado :",JSON.stringify(usuarioeliminado));
		res.status(202).send("Empleado borrado");

	}
);

// Incluimos el "router" dentro de lo
// que este archivo ha de exportar.
module.exports = router;