const express = require("express");
const { PrismaClient } = require("@prisma/client");
const bcrypt = require("bcrypt");
const crypto = require("crypto");
const Joi = require("joi");
const validate = require("../utils/middleware/validate");

const router = express.Router();
const prisma = new PrismaClient();

/**
 * Crea o regresa el token actualizado de un usuario
 * @param {prisma.usuario} user modelo de usuario
 * @returns {string} el token actualizado de dicho usuario
 */
async function obtainAuthToken(user) {
  if (user.token) return token;
  const token = crypto.randomBytes(40).toString("hex");
  await prisma.usuario.update({
    where: {
      id: user.id,
    },
    data: { token },
  });
  return token;
}

/**
 * Crea una hash con 12 rondas de sal, a partir de una entrada y lo regresa
 * @param {string} pwd contraseña en texto claro
 * @returns hash de la contraseña
 */
const hashPassword = (pwd) =>
  new Promise((res, rej) =>
    bcrypt.hash(pwd, 12, (err, password) => {
      if (err) return rej(err);
      return res(password);
    })
  );

/**
 * @swagger
 * /auth/login:
 *   post:
 *     summary: Login a user and returns a token.
 */
router.post(
  "/login",
  validate(
    Joi.object({
      email: Joi.string().email().required(),
      contrasegna: Joi.string().required(),
    })
  ),
  async (req, res) => {
    const { email, contrasegna } = req.body;
    const user = await prisma.usuario.findFirst({
      where: {
        email,
      },
    });
    if (user) {
      const match = await bcrypt.compare(contrasegna, user.contrasegna);
      if (match) {
        const token = await obtainAuthToken(user);
        return res.json({ token });
      }
    }

    return res.status(401).json({ message: "Invalid credentials" });
  }
);

/**
 * @swagger
 * /auth/register:
 *   post:
 *     summary: Registra y regresa a un usuario
 */
router.post(
  "/register",
  validate(
    Joi.object({
      email: Joi.string().email().required(),
      contrasegna: Joi.string().required(),
    })
  ),
  async (req, res) => {
    // Checking for email uniqueness
    const userCount = await prisma.usuario.count({
      where: { email: req.body.email },
    });
    if (userCount) {
      return res.status(400).json({
        error: "An account with that email already exists.",
      });
    }
    console.log(req.body.contrasegna);
    const user = await prisma.usuario.create({
      data: {
        ...req.body,
        contrasegna: await hashPassword(req.body.contrasegna),
      },
      select: {
        email: true,
      },
    });
    return res.status(201).json(user);
  }
);

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
      Joi.object({ // Validando info
	  nombre: Joi.string().required(),
	  estado: Joi.string().required(),
	  calle:  Joi.string().required(),
	  //numero: Joi.number().required(),  Falta en formulario
	  cp:     Joi.number().required(),
	  muni:   Joi.string().required(),
      })
  ),
  async (req, res) => {
      // Checar unicidad en nombre de restaurante,
      // ¿Debe ser sobre id?
      // Si sí hay que solicitarlo de alguna forma y cambiar
      // lo siguiente para checar id en lugar del nombre.
      const restaurantCount = await prisma.restaurante.count({
	  where: { nombre: req.body.nombre },
      });
      if(restaurantCount){ // !null
	  return res.status(400).json({
              error: "A restaurant with that name is already registered.",
	  });
      }
      console.log(req.body.nombre);
      const restaurante = await.prisma.restaurante.create(
	  {
	      data: {
		  ...req.body, // info checada en Joi, preguntar a David
	      },
	  }
      );

      return.status(201).json(restaurante);
  }
);

module.exports = router;
