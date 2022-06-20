const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();
const validate = require("../utils/middleware/validate");

const { hasRole, bearerAuth } = require("../utils/middleware/auth");
const { estaAutenticado } = require("../utils/middleware/auth");

//crea una orden
router.post(
  "/",
  estaAutenticado,
  hasRole("cliente"),
  validate(
    Joi.object({
      idorden: Joi.number().integer().required(),
      idcliente: Joi.number().integer().required(),
      mesa: Joi.string(),
      domicilio: Joi.string(),
      estado: Joi.number().integer().required(),
      esCarrito: Joi.boolean().required(),
      pagado: Joi.boolean().required(),
      costo: Joi.number().required(),
    }),
    "body"
  ),
  async (req, res) => {
    const { idorden, mesa, domicilio, estado, esCarrito, pagado, costo } =
      req.body;
    const orden = await prisma.orden.create({
      idorden: idorden,
      mesa: mesa,
      domicilio: domicilio,
      estado: estado,
      esCarrito: esCarrito,
      pagado: pagado,
      costo: costo,
    });
    res.json(orden);
  }
);

router.post("/newcart", async (req, res) => {
  const cliente = await prisma.cliente.findFirst({
    where: {
      idusuario: req.user.idusuario,
    },
  });

  const carrito = await prisma.orden.create({
    data: {
      cliente: { connect: { idcliente: cliente.idcliente } },
      restaurante: { connect: { idrestaurante: 1 } },
      mesa: { connect: { idmesa: 1 } },
      estado: "RECIBIDA",
      esCarrito: true,
      pagado: false,
      costo: 0,
    },
  });

  res.json(carrito);
});

//Regresa el carrito de un cliente
router.get("/carrito", async (req, res) => {
  const cliente = await prisma.cliente.findFirst({
    where: {
      idusuario: req.user.idusuario,
    },
  });

  let orden = await prisma.orden.findFirst({
    where: {
      idcliente: cliente.idcliente,
      esCarrito: true,
    },
  });
  if (!orden)
    orden = await prisma.orden.create({
      data: {
        cliente: { connect: { idcliente: cliente.idcliente } },
        restaurante: { connect: { idrestaurante: 1 } },
        estado: "RECIBIDA",
        esCarrito: true,
        pagado: false,
        costo: 0,
      },
    });

  res.json(orden);
});

//Regresa la orden dado un id
router.get(
  "/orden/:idorden",
  validate(
    Joi.object({
      idorden: Joi.number().integer().required(),
    }),
    "params"
  ),
  async (req, res) => {
    const orden = await prisma.orden.findFirst({
      where: {
        idorden: req.params.idorden,
      },
    });

    res.json(orden);
  }
);

//ordenes de un cliente que no son carrito
router.get("/ordenes", bearerAuth, async (req, res) => {
  const cliente = await prisma.cliente.findFirst({
    where: {
      idusuario: req.user.idusuario,
    },
  });

  const orden = await prisma.orden.findMany({
    where: {
      idcliente: cliente.idcliente,
      esCarrito: false,
    },
  });

  res.json(orden);
});

//platillos de una orden/carrito dado el id
router.get(
  "/platillos/:idorden",
  validate(
    Joi.object({
      idorden: Joi.number().integer().required(),
    }),
    "params"
  ),
  async (req, res) => {
    const { idorden } = req.params;
    const platillos = await prisma.contenidoorden.findMany({
      where: {
        idorden,
      },
    });
    res.json(platillos);
  }
);

//para obtener índice
router.get(
  "/contenidoorden/:idorden/:idplatillo",
  validate(
    Joi.object({
      idorden: Joi.number().integer().required(),
      idplatillo: Joi.number().integer().required(),
    }),
    "params"
  ),
  async (req, res) => {
    const { idorden, idplatillo } = req.params;
    const contenidoorden = await prisma.contenidoorden.findFirst({
      where: {
        idorden: idorden,
        idplatillo: idplatillo,
      },
    });
    res.json(contenidoorden);
  }
);

//agregar platillos
router.post(
  "/adddish/:idorden/:idplatillo",
  //estaAutenticado,
  //hasRole("cliente"),
  validate(
    Joi.object({
      idorden: Joi.number().integer().required(),
      idplatillo: Joi.number().integer().required(),
    }),
    "params"
  ),
  async (req, res) => {
    const { idorden, idplatillo } = req.params;
    const platillo = await prisma.contenidoorden.create({
      data: {
        idorden: idorden,
        idplatillo: idplatillo,
      },
    });
    res.json(platillo);
  }
);

//eliminar algun platillos
router.delete(
  "/deletedish/:idcontenidoorden",
  //estaAutenticado,
  //hasRole("cliente"),
  validate(
    Joi.object({
      idcontenidoorden: Joi.number().integer().required(),
    }),
    "params"
  ),
  async (req, res) => {
    const { idcontenidoorden } = req.params;
    const platillo = await prisma.contenidoorden.delete({
      where: {
        idcontenidoorden: idcontenidoorden,
      },
    });
    res.json(platillo);
  }
);

//eliminar platillos de una orden
router.delete(
  "/deletecontenido/:idorden",
  //estaAutenticado,
  //hasRole("cliente"),
  validate(
    Joi.object({
      idorden: Joi.number().integer().required(),
    }),
    "params"
  ),
  async (req, res) => {
    const { idorden } = req.params;
    const platillo = await prisma.contenidoorden.deleteMany({
      where: {
        idorden: idorden,
      },
    });
    res.json(platillo);
  }
);

//elimar todas las apariciones de un platillo en una orden
router.delete(
  "/deletedishes/:idorden/:idplatillo",
  validate(
    Joi.object({
      idorden: Joi.number().integer().required(),
      idplatillo: Joi.number().integer().required(),
    }),
    "params"
  ),
  async (req, res) => {
    const { idorden, idplatillo} = req.params;
    const platillos = await prisma.contenidoorden.deleteMany({
      where: {
        idorden: idorden,
        idplatillo: idplatillo,
      },
    });
    res.json(platillos);
  }
)

//confirmar una orden
router.put(
  "/confirmar/:idorden/:costo",
  //estaAutenticado,
  //hasRole("cliente"),
  validate(
    Joi.object({
      idorden: Joi.number().integer().required(),
      costo: Joi.number(),
    }),
    "params"
  ),
  async (req, res) => {
    const { idorden, costo } = req.params;
    let anterior, actualizado;
    try {
      anterior = await prisma.orden.findUnique({
        where: { idorden: idorden },
        select: {
          esCarrito: true,
        },
      });

      actualizado = await prisma.orden.update({
        where: { idorden: idorden },
        data: { esCarrito: !anterior.esCarrito, costo: costo },
      });
      res.json(actualizado);
    } catch (error) {
      res.json({ error: `La orden ${idorden} no existe en la base de datos` });
    }
  }
);

module.exports = router;
