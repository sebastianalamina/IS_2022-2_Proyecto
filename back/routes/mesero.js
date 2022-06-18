const express = require("express");
const Joi = require("joi");
const validate = require("../utils/middleware/validate");
const roles = require("../utils/constants/roles");
const router = express.Router();
const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

/**
 * "true" si el correo dado corresponde a un mesero
 * que no ha sido registrado por un administrador.
 * "false" en otro caso.
 */
router.get(
  "/",
  validate(
    Joi.object({
      email: Joi.string().email().required(),
    }),
    "query"
  ),
  async (req, res) => {

    const email = req.query.email;

    // Primero, buscamos al usuario con dicho correo.
    let user;
    try { // <- Issue #45 del repo.
      user = await prisma.usuario.findFirst({
        where: {
          email,
        },
      });
    } catch (e) {
      return res.status(404).send({ error: e });
    }

    // Si no hay tal usuario con dicho correo, o si
    // no se trata de un mesero, devolvemos "false".
    if (user == null || user.rol != roles.MESERO)
      return res.status(200).send(false);

    // Luego, buscamos al mesero con dicho ID de usuario.
    let mesero;
    try {
      mesero = await prisma.mesero.findFirst({
        where: {
          idusuario: user.idusuario,
        },
      });
    } catch (e) {
      return res.status(404).send({ error: e });
    }

    // Si no existe el mesero, entonces se trata de un
    // usuario mesero que no ha sido registrado por algún
    // administrador. Devolvemos "true".
    if (mesero == null)
      return res.status(200).send(true);

    // De lo contrario, devolvemos "false".
    return res.status(200).send(false);
  }
);

/**
 * Dado un email correspondiente a un mesero,
 * devuelve el ID del restaurante asociado al mesero.
 */
router.get(
  "/get-restaurante/",
  validate(
    Joi.object({
      email: Joi.string().email().required(),
    }),
    "query"
  ),
  async (req, res) => {

    const email = req.query.email;

    // Primero, buscamos al usuario con dicho correo.
    let user;
    try { // <- Issue #45 del repo.
      user = await prisma.usuario.findFirst({
        where: {
          email,
        },
      });
    } catch (e) {
      return res.status(404).send({ error: e });
    }

    // Errores.
    if (user == null)
      return res.status(404).send({ error: "Usuario no encontrado."});
    if (user.rol != roles.MESERO)
      return res.status(404).send({ error: "Usuario no es mesero."});

    // Luego, buscamos al mesero con dicho ID de usuario.
    let mesero;
    try {
      mesero = await prisma.mesero.findFirst({
        where: {
          idusuario: user.idusuario,
        },
      });
    } catch (e) {
      return res.status(404).send({ error: e });
    }

    // Errores.
    if (mesero == null)
      return res.status(404).send({ error: "Mesero no registrado por algún administrador."});

    // Devolvemos el restaurante.
    return res.json(mesero.idrestaurante);

  }
);

/**
 * Dado un correo de un mesero, y un ID de orden,
 * devuelve la orden si ésta pertenece al restaurante
 * del mesero dado.
 */
router.get(
  "/orden",
  validate(
    Joi.object({
      email: Joi.string().email().required(),
      idorden: Joi.number().integer().required(),
    }),
    "query"
  ),
  async (req, res) => {

    const email = req.query.email;
    const idorden = req.query.idorden;

    // Primero, buscamos al usuario con dicho correo.
    let user;
    try { // <- Issue #45 del repo.
      user = await prisma.usuario.findFirst({
        where: {
          email,
        },
      });
    } catch (e) {
      return res.status(404).send({ error: e });
    }

    // Errores.
    if (user == null)
      return res.status(404).send({ error: "Usuario no encontrado."});
    if (user.rol != roles.MESERO)
      return res.status(404).send({ error: "Usuario no es mesero."});

    // Luego, buscamos al mesero con dicho ID de usuario.
    let mesero;
    try {
      mesero = await prisma.mesero.findFirst({
        where: {
          idusuario: user.idusuario,
        },
      });
    } catch (e) {
      return res.status(404).send({ error: e });
    }

    // Errores.
    if (mesero == null)
      return res.status(404).send({ error: "Mesero no registrado por algún administrador."});

    // Finalmente, buscamos la orden asociada al
    // restaurante de dicho mesero.
    let orden;
    try {
      orden = await prisma.orden.findFirst({
        where: {
          idorden: idorden,
          idrestaurante: mesero.idrestaurante,
        },
      })
    } catch (e) {
      return rest.status(400).send({ error : e });
    }

    // Devolvemos la orden.
    res.json(orden);
  }
);

module.exports = router;
