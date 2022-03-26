const express = require("express");
const { PrismaClient } = require("@prisma/client");
const bcrypt = require("bcrypt");
const crypto = require("crypto");

const router = express.Router();
const prisma = new PrismaClient();

/**
 * Crea o regresa el token actualizado de un usuario
 * @param {prisma.usuario} user modelo de usuario
 * @returns {String} el token actualizado de dicho usuario
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
 * @swagger
 * /auth/login:
 *   post:
 *     summary: Login a user and returns a token.
 */
router.post("/login", async (req, res) => {
  const { email, password } = req.data;
  const user = await prisma.usuario.findFirst({
    where: {
      email,
    },
  });
  if (user) {
    const match = await bcrypt.compare(password, user.password);
    if (match) {
      const token = obtainAuthToken(user);
      return res.json({ token });
    }
  }

  return res.status(401).json({ message: "Invalid credentials" });
});

/**
 * @swagger
 * /auth/register:
 *   post:
 *     summary: Registra y regresa a un usuario
 */
router.post("/register", async (req, res) => {
  // Checking for email uniqueness
  const userCount = await prisma.usuario.count({
    where: { email: req.body.email },
  });
  if (userCount) {
    return res.status(400).json({
      error: "An account with that email already exists.",
    });
  }
  const user = await prisma.usuario.create({ data: req.body });
  return res.status(201).json(user);
});

module.exports = router;
