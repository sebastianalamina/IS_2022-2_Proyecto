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
  if (user.token) return user.token;
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

module.exports = router;
