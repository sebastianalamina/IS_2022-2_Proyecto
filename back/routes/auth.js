const express = require("express");
const { PrismaClient } = require("@prisma/client");
const bcrypt = require("bcrypt");
const crypto = require("crypto");
const Joi = require("joi");
const validate = require("../utils/middleware/validate");
const Mailer = require("../utils/email");
const roles = require("../utils/constants/roles");

const router = express.Router();
const prisma = new PrismaClient();
const mailer = new Mailer();

/**
 * Crea o regresa el token actualizado de un usuario
 * @param {prisma.usuario} user modelo de usuario
 * @returns {string} el token actualizado de dicho usuario
 */
async function obtainAuthToken(user) {
  if (user.token) return user.token;
  const token = crypto.randomBytes(40).toString("hex");

  try {
    // <- Issue #45 del repo.
    await prisma.usuario.update({
      where: {
        idusuario: user.idusuario,
      },
      data: { token },
    });
  } catch (e) {
    if (e.meta.cause === "Record to update not found.")
      return res.status(404).send({ error: "registro no encontrado" });
  }

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

    let user;
    try {
      // <- Issue #45 del repo.
      user = await prisma.usuario.findFirst({
        where: {
          email,
        },
      });
      if (user) {
        const match = await bcrypt.compare(contrasegna, user.contrasegna);
        if (match) {
          const token = await obtainAuthToken(user);
          return res.json({ token, rol: user.rol });
        }
      }
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
        return res.status(404).send({ error: "registro no encontrado" });
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
      nombre: Joi.string().required(),
      contrasegna: Joi.string().required(),
      rol: Joi.string()
        .valid(roles.ADMINISTRADOR, roles.CLIENTE, roles.REPARTIDOR, roles.MESERO)
        .required(),
      nombre: Joi.string().required(),
      estado: Joi.string().required(),
      calle: Joi.string().required(),
      numero: Joi.number().integer().required(),
      cp: Joi.number().integer().required(),
      municipio: Joi.string().required(),
    })
  ),
  async (req, res) => {
    // Checking for email uniqueness

    let userCount;
    try {
      // <- Issue #45 del repo.
      userCount = await prisma.usuario.count({
        where: { email: req.body.email },
      });
    } catch (e) {
      console.log(e);
      return res.status(404).send({ error: "registro no encontrado" });
    }

    if (userCount) {
      return res.status(400).json({
        error: "An account with that email already exists.",
      });
    }

    let user;
    try {
      // <- Issue #45 del repo.
      user = await prisma.usuario.create({
        data: {
          ...req.body,
          confirmado: false,
          contrasegna: await hashPassword(req.body.contrasegna),
        },
        select: {
          email: true,
          idusuario: true,
        },
      });
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
        return res.status(404).send({ error: "registro no encontrado" });
    }

    if (req.body.rol != roles.MESERO) {

      try {
        await prisma[req.body.rol].create({
          data: {
            idusuario: user.idusuario,
          },
        });
      } catch (e) {
        await prisma.usuario.delete({
          select: {
            idusuario: user.idusuario,
          },
        });
        return res.status(500).send("algo salio mal");
      }

    }

    mailer
      .send({
        to: req.body.email,
        subject: "Confirmación correo",
        html: "utils/email/templates/confirmaCorreo.mustache",
        context: {
          username: req.body.email, //cambiar nombre
          id: user.idusuario,
        },
      })
      .catch(() => {});

    delete user.idusuario;
    return res.status(200).json(user);
  }
);

router.get(
  "/verifica/:id",
  validate(
    Joi.object({
      id: Joi.number().integer().required(),
    }),
    "params"
  ),
  async (req, res) => {
    try {
      await prisma.usuario.update({
        where: {
          idusuario: req.params.id,
        },
        data: {
          confirmado: true,
        },
      });
    } catch (e) {
      if (e.meta.cause === "Record to update not found.")
        return res.status(404).send({ error: "registro no encontrado" });
    }
    res.send("ok");
  }
);

module.exports = router;
