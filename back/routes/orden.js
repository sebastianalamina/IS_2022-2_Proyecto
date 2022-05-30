const express = require("express");
const { PrismaClient } = require("@prisma/client");
const Joi = require("joi");

const router = express.Router();
const prisma = new PrismaClient();
const validate = require("../utils/middleware/validate");

/**
 * POST orden/ crea una nueva orden a partir del contenido de un carrito
 */
router.post("/" ,
  validate(
    Joi.object({
      idcarrito : Joi.number().required(),
      metodopago : Joi.string().required(),
    }),
    "body"
  ),
  async (req,res)=>{
    const {idcarrito, metodopago} = req.body;
    //Checamos si existe el carrito con el ID dado.
    const carrito = await prisma.carrito.findFirst({
      where:{
        idcarrito : idcarrito
      },
    });
    if (!carrito){
      return res.status(404).json({
        message: "No existe el carrito con el ID dado."
      });
    }
    // Consultamos el contenido del carrito.
    const contenidoCarrito = await prisma.contenidoCarrito.findMany({
      where:{
        idcarrito : idcarrito
      },
      select:{
        idplatillo : true,
      },
    });

    

    // Creamos la orden normal.
    const ordenNormal = await prisma.ordennormal.create({
      data:{
        costo : carrito.costo, 
        estado : "EN_PROCESO", 
      }
    });
    // Creamos la orden de envio.
    const ordenEnvio = await prisma.ordenenvio.create({
      data :{
        costo : carrito.costo,  
      }

    });

    // creamos el contenido de la orden.
    const contenidoOrden = await prisma.contenidoorden.createMany({
      data: contenidoCarrito.map( obj =>(
        {
        ...obj,
        idordennormal : ordenNormal.idordennormal,
        idordenenvio: ordenEnvio.idordenenvio, 
        }
      ))
    });

    // Creamos la confirmacion de carrito.
    console.log("el problema esta en la cofinmacion de carrito")
    const confirmacionCarrito = await prisma.confirmacionCarrito.create({
      data:{
        metodopago : metodopago,
        idcarrito : parseInt(carrito.idcarrito),
        idordenenvio : ordenEnvio.idordenenvio,
        idordennormal : ordenNormal.idordennormal, 
      },
  });
  res.json(confirmacionCarrito)
    
  }
)


module.exports = router;