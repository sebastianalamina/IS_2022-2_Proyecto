-- CreateEnum
CREATE TYPE "estadoorden" AS ENUM ('RECIBIDA', 'EN_PROCESO', 'EN_CAMINO', 'ENTREGADA');

-- CreateTable
CREATE TABLE "administrador" (
    "idadmin" SERIAL NOT NULL,
    "idrestaurante" INTEGER NOT NULL,
    "nombre" CHAR(100) NOT NULL,
    "apatermo" CHAR(100),
    "amaterno" CHAR(100),
    "idusuario" INTEGER NOT NULL,

    CONSTRAINT "administrador_pkey" PRIMARY KEY ("idadmin")
);

-- CreateTable
CREATE TABLE "cliente" (
    "idcliente" SERIAL NOT NULL,
    "nombre" CHAR(100) NOT NULL,
    "apatermo" CHAR(100),
    "amaterno" CHAR(100),
    "estado" VARCHAR(100),
    "calle" VARCHAR(100),
    "numero" INTEGER,
    "cp" INTEGER,
    "municipio" VARCHAR(100),
    "idusuario" INTEGER NOT NULL,

    CONSTRAINT "cliente_pkey" PRIMARY KEY ("idcliente")
);

-- CreateTable
CREATE TABLE "cocinero" (
    "idcocinero" SERIAL NOT NULL,
    "idadmin" INTEGER NOT NULL,
    "idrestaurante" INTEGER NOT NULL,
    "nombre" CHAR(100) NOT NULL,
    "apatermo" CHAR(100),
    "amaterno" CHAR(100),
    "idusuario" INTEGER NOT NULL,

    CONSTRAINT "cocinero_pkey" PRIMARY KEY ("idcocinero")
);

-- CreateTable
CREATE TABLE "contenidoorden" (
    "idcontenidoorden" SERIAL NOT NULL,
    "idordennormal" INTEGER,
    "idordenenvio" INTEGER,
    "idplatillo" INTEGER,

    CONSTRAINT "contenidoorden_pkey" PRIMARY KEY ("idcontenidoorden")
);

-- CreateTable
CREATE TABLE "entregadomicilio" (
    "identregadomicilio" SERIAL NOT NULL,
    "idrepartidor" INTEGER NOT NULL,
    "idordenenvio" INTEGER NOT NULL,
    "estado" CHAR(18) NOT NULL,

    CONSTRAINT "entregadomicilio_pkey" PRIMARY KEY ("identregadomicilio")
);

-- CreateTable
CREATE TABLE "entregamesa" (
    "identregamesa" SERIAL NOT NULL,
    "idmesero" INTEGER NOT NULL,
    "idordennormal" INTEGER NOT NULL,
    "estado" CHAR(18) NOT NULL,

    CONSTRAINT "entregamesa_pkey" PRIMARY KEY ("identregamesa")
);

-- CreateTable
CREATE TABLE "franquicia" (
    "idfranquicia" SERIAL NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,

    CONSTRAINT "franquicia_pkey" PRIMARY KEY ("idfranquicia")
);

-- CreateTable
CREATE TABLE "menu" (
    "idmenu" SERIAL NOT NULL,
    "idrestaurante" INTEGER NOT NULL,
    "idfranquicia" INTEGER NOT NULL,

    CONSTRAINT "menu_pkey" PRIMARY KEY ("idmenu")
);

-- CreateTable
CREATE TABLE "mesero" (
    "idmesero" SERIAL NOT NULL,
    "idadmin" INTEGER NOT NULL,
    "idrestaurante" INTEGER NOT NULL,
    "nombre" CHAR(100) NOT NULL,
    "apatermo" CHAR(100),
    "amaterno" CHAR(100),
    "idusuario" INTEGER NOT NULL,

    CONSTRAINT "mesero_pkey" PRIMARY KEY ("idmesero")
);

-- CreateTable
CREATE TABLE "ordenenvio" (
    "idordenenvio" SERIAL NOT NULL,
    "costo" INTEGER NOT NULL,

    CONSTRAINT "ordenenvio_pkey" PRIMARY KEY ("idordenenvio")
);

-- CreateTable
CREATE TABLE "ordenescliente" (
    "idordencliente" SERIAL NOT NULL,
    "idcliente" INTEGER NOT NULL,
    "idordenenvio" INTEGER NOT NULL,
    "idordennormal" INTEGER NOT NULL,
    "metodopago" CHAR(18),

    CONSTRAINT "ordenescliente_pkey" PRIMARY KEY ("idordencliente")
);

-- CreateTable
CREATE TABLE "ordennormal" (
    "idordennormal" SERIAL NOT NULL,
    "costo" INTEGER NOT NULL,
    "estado" "estadoorden" NOT NULL,

    CONSTRAINT "ordennormal_pkey" PRIMARY KEY ("idordennormal")
);

-- CreateTable
CREATE TABLE "platillo" (
    "idplatillo" SERIAL NOT NULL,
    "idmenu" INTEGER NOT NULL,
    "idrestaurante" INTEGER NOT NULL,
    "idfranquicia" INTEGER NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,
    "costo" INTEGER NOT NULL,

    CONSTRAINT "platillo_pkey" PRIMARY KEY ("idplatillo")
);

-- CreateTable
CREATE TABLE "prepararorden" (
    "idpreparaorden" SERIAL NOT NULL,
    "idcocinero" INTEGER NOT NULL,
    "idordenenvio" INTEGER NOT NULL,
    "idordennormal" INTEGER NOT NULL,

    CONSTRAINT "prepararorden_pkey" PRIMARY KEY ("idpreparaorden")
);

-- CreateTable
CREATE TABLE "registrorestaurante" (
    "idregistrorestaurante" SERIAL NOT NULL,
    "idadmin" INTEGER NOT NULL,
    "idrestaurante" INTEGER NOT NULL,
    "fecha" DATE NOT NULL,

    CONSTRAINT "registrorestaurante_pkey" PRIMARY KEY ("idregistrorestaurante")
);

-- CreateTable
CREATE TABLE "repartidor" (
    "idrepartidor" SERIAL NOT NULL,
    "nombre" CHAR(100) NOT NULL,
    "apatermo" CHAR(100),
    "amaterno" CHAR(100),
    "idusuario" INTEGER,

    CONSTRAINT "repartidor_pkey" PRIMARY KEY ("idrepartidor")
);

-- CreateTable
CREATE TABLE "restaurante" (
    "idrestaurante" SERIAL NOT NULL,
    "idfranquicia" INTEGER NOT NULL,
    "nombre" VARCHAR(100),
    "estado" VARCHAR(100),
    "calle" VARCHAR(100),
    "numero" INTEGER,
    "cp" INTEGER,
    "municipio" VARCHAR(100),

    CONSTRAINT "restaurante_pkey" PRIMARY KEY ("idrestaurante")
);

-- CreateTable
CREATE TABLE "inventario" (
    "idinventario" SERIAL NOT NULL,
    "nombre" CHAR(100) NOT NULL,
    "cantidad" INTEGER NOT NULL,
    "idrestaurante" INTEGER NOT NULL,

    CONSTRAINT "inventario_pkey" PRIMARY KEY ("idinventario")
);

-- CreateTable
CREATE TABLE "usuario" (
    "email" VARCHAR(255),
    "contrasegna" VARCHAR(255),
    "token" VARCHAR(255),
    "rol" VARCHAR(255),
    "idusuario" SERIAL NOT NULL,

    CONSTRAINT "usuario_pkey" PRIMARY KEY ("idusuario")
);

-- AddForeignKey
ALTER TABLE "administrador" ADD CONSTRAINT "fk_admin" FOREIGN KEY ("idrestaurante") REFERENCES "restaurante"("idrestaurante") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "administrador" ADD CONSTRAINT "fk_usuario" FOREIGN KEY ("idusuario") REFERENCES "usuario"("idusuario") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cliente" ADD CONSTRAINT "fk_usuario" FOREIGN KEY ("idusuario") REFERENCES "usuario"("idusuario") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cocinero" ADD CONSTRAINT "fk_cocinero1" FOREIGN KEY ("idadmin") REFERENCES "administrador"("idadmin") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cocinero" ADD CONSTRAINT "fk_cocinero2" FOREIGN KEY ("idrestaurante") REFERENCES "restaurante"("idrestaurante") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cocinero" ADD CONSTRAINT "fk_usuario" FOREIGN KEY ("idusuario") REFERENCES "usuario"("idusuario") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contenidoorden" ADD CONSTRAINT "fk_contenido2" FOREIGN KEY ("idordenenvio") REFERENCES "ordenenvio"("idordenenvio") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contenidoorden" ADD CONSTRAINT "fk_contenido1" FOREIGN KEY ("idordennormal") REFERENCES "ordennormal"("idordennormal") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contenidoorden" ADD CONSTRAINT "fk_contenido3" FOREIGN KEY ("idplatillo") REFERENCES "platillo"("idplatillo") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "entregadomicilio" ADD CONSTRAINT "fk_or2" FOREIGN KEY ("idordenenvio") REFERENCES "ordenenvio"("idordenenvio") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "entregadomicilio" ADD CONSTRAINT "fk_or1" FOREIGN KEY ("idrepartidor") REFERENCES "repartidor"("idrepartidor") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "entregamesa" ADD CONSTRAINT "fk_em1" FOREIGN KEY ("idmesero") REFERENCES "mesero"("idmesero") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "entregamesa" ADD CONSTRAINT "fk_em2" FOREIGN KEY ("idordennormal") REFERENCES "ordennormal"("idordennormal") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "menu" ADD CONSTRAINT "fk_menu1" FOREIGN KEY ("idrestaurante") REFERENCES "restaurante"("idrestaurante") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mesero" ADD CONSTRAINT "fk_mesero1" FOREIGN KEY ("idadmin") REFERENCES "administrador"("idadmin") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mesero" ADD CONSTRAINT "fk_mesero2" FOREIGN KEY ("idrestaurante") REFERENCES "restaurante"("idrestaurante") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mesero" ADD CONSTRAINT "fk_usuario" FOREIGN KEY ("idusuario") REFERENCES "usuario"("idusuario") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ordenescliente" ADD CONSTRAINT "fk_oc1" FOREIGN KEY ("idcliente") REFERENCES "cliente"("idcliente") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ordenescliente" ADD CONSTRAINT "fk_oc2" FOREIGN KEY ("idordenenvio") REFERENCES "ordenenvio"("idordenenvio") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ordenescliente" ADD CONSTRAINT "fk_oc3" FOREIGN KEY ("idordennormal") REFERENCES "ordennormal"("idordennormal") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "platillo" ADD CONSTRAINT "fk_paltillo1" FOREIGN KEY ("idmenu") REFERENCES "menu"("idmenu") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "prepararorden" ADD CONSTRAINT "fk_po1" FOREIGN KEY ("idcocinero") REFERENCES "cocinero"("idcocinero") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "prepararorden" ADD CONSTRAINT "fk_po2" FOREIGN KEY ("idordenenvio") REFERENCES "ordenenvio"("idordenenvio") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "prepararorden" ADD CONSTRAINT "fk_po3" FOREIGN KEY ("idordennormal") REFERENCES "ordennormal"("idordennormal") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "registrorestaurante" ADD CONSTRAINT "fk_reg1" FOREIGN KEY ("idadmin") REFERENCES "administrador"("idadmin") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "registrorestaurante" ADD CONSTRAINT "fk_reg2" FOREIGN KEY ("idrestaurante") REFERENCES "restaurante"("idrestaurante") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "repartidor" ADD CONSTRAINT "fk_usuario" FOREIGN KEY ("idusuario") REFERENCES "usuario"("idusuario") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "restaurante" ADD CONSTRAINT "fk_restaurante" FOREIGN KEY ("idfranquicia") REFERENCES "franquicia"("idfranquicia") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "inventario" ADD CONSTRAINT "fk_inventario" FOREIGN KEY ("idrestaurante") REFERENCES "restaurante"("idrestaurante") ON DELETE NO ACTION ON UPDATE NO ACTION;
