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

// uwu

// Incluimos el "router" dentro de lo
// que este archivo ha de exportar.
module.exports = router;