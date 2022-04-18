-- CreateTable
CREATE TABLE "menu" (
    "idmenu" SERIAL NOT NULL,
    "idrestaurante" CHAR(18) NOT NULL,
    "idfranquicia" CHAR(18) NOT NULL,

    CONSTRAINT "pk_menu" PRIMARY KEY ("idmenu","idrestaurante","idfranquicia")
);

-- CreateTable
CREATE TABLE "administrador" (
    "idadmin" CHAR(18) NOT NULL,
    "idrestaurante" CHAR(18) NOT NULL,
    "nombre" CHAR(100) NOT NULL,
    "apatermo" CHAR(100),
    "amaterno" CHAR(100),
    "correo" VARCHAR(100) NOT NULL,
    "contrasena" VARCHAR(100) NOT NULL,

    CONSTRAINT "pk_admin" PRIMARY KEY ("idadmin")
);

-- CreateTable
CREATE TABLE "cliente" (
    "idcliente" CHAR(18) NOT NULL,
    "nombre" CHAR(100) NOT NULL,
    "apatermo" CHAR(100),
    "amaterno" CHAR(100),
    "correo" VARCHAR(100) NOT NULL,
    "contrasena" VARCHAR(100) NOT NULL,
    "estado" VARCHAR(100),
    "calle" VARCHAR(100),
    "numero" INTEGER,
    "cp" INTEGER,
    "municipio" VARCHAR(100),

    CONSTRAINT "pk_cliente" PRIMARY KEY ("idcliente")
);

-- CreateTable
CREATE TABLE "cocinero" (
    "idcocinero" CHAR(18) NOT NULL,
    "idadmin" CHAR(18) NOT NULL,
    "idrestaurante" CHAR(18) NOT NULL,
    "nombre" CHAR(100) NOT NULL,
    "apatermo" CHAR(100),
    "amaterno" CHAR(100),
    "correo" VARCHAR(100) NOT NULL,
    "contrasena" VARCHAR(100) NOT NULL,

    CONSTRAINT "pk_cocinero" PRIMARY KEY ("idcocinero")
);

-- CreateTable
CREATE TABLE "contenidoorden" (
    "idordennormal" CHAR(18),
    "idordenenvio" CHAR(18),
    "idplatillo" CHAR(18)
);

-- CreateTable
CREATE TABLE "entregadomicilio" (
    "idrepartidor" CHAR(18) NOT NULL,
    "idordenenvio" CHAR(18) NOT NULL,
    "estado" CHAR(18) NOT NULL
);

-- CreateTable
CREATE TABLE "entregamesa" (
    "idmesero" CHAR(18) NOT NULL,
    "idordennormal" CHAR(18) NOT NULL,
    "estado" CHAR(18) NOT NULL
);

-- CreateTable
CREATE TABLE "franquicia" (
    "idfranquicia" CHAR(18) NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,

    CONSTRAINT "pk_franquicia" PRIMARY KEY ("idfranquicia")
);

-- CreateTable
CREATE TABLE "mesero" (
    "idmesero" CHAR(18) NOT NULL,
    "idadmin" CHAR(18) NOT NULL,
    "idrestaurante" CHAR(18) NOT NULL,
    "nombre" CHAR(100) NOT NULL,
    "apatermo" CHAR(100),
    "amaterno" CHAR(100),
    "correo" VARCHAR(100) NOT NULL,
    "contrasena" VARCHAR(100) NOT NULL,

    CONSTRAINT "pk_mesero" PRIMARY KEY ("idmesero")
);

-- CreateTable
CREATE TABLE "ordenenvio" (
    "idordenenvio" CHAR(18) NOT NULL,
    "costo" INTEGER NOT NULL,

    CONSTRAINT "pk_oe" PRIMARY KEY ("idordenenvio")
);

-- CreateTable
CREATE TABLE "ordenescliente" (
    "idcliente" CHAR(18) NOT NULL,
    "idordenenvio" CHAR(18),
    "idordennormal" CHAR(18),
    "metodopago" CHAR(18)
);

-- CreateTable
CREATE TABLE "ordennormal" (
    "idordennormal" CHAR(18) NOT NULL,
    "costo" INTEGER NOT NULL,

    CONSTRAINT "pk_on" PRIMARY KEY ("idordennormal")
);

-- CreateTable
CREATE TABLE "platillo" (
    "idplatillo" CHAR(18) NOT NULL,
    "idmenu" INTEGER NOT NULL,
    "idrestaurante" CHAR(18) NOT NULL,
    "idfranquicia" CHAR(18) NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,
    "costo" INTEGER NOT NULL,

    CONSTRAINT "pk_platillo" PRIMARY KEY ("idplatillo","idmenu","idrestaurante","idfranquicia")
);

-- CreateTable
CREATE TABLE "prepararorden" (
    "idcocinero" CHAR(18) NOT NULL,
    "idordenenvio" CHAR(18),
    "idordennormal" CHAR(18)
);

-- CreateTable
CREATE TABLE "registrorestaurante" (
    "idadmin" CHAR(18) NOT NULL,
    "idrestaurante" CHAR(18) NOT NULL,
    "fecha" DATE NOT NULL
);

-- CreateTable
CREATE TABLE "repartidor" (
    "idrepartidor" CHAR(18) NOT NULL,
    "nombre" CHAR(100) NOT NULL,
    "apatermo" CHAR(100),
    "amaterno" CHAR(100),
    "correo" VARCHAR(100) NOT NULL,
    "contrasena" VARCHAR(100) NOT NULL,

    CONSTRAINT "pk_repartidor" PRIMARY KEY ("idrepartidor")
);

-- CreateTable
CREATE TABLE "restaurante" (
    "idrestaurante" CHAR(18) NOT NULL,
    "idfranquicia" CHAR(18) NOT NULL,
    "nombre" VARCHAR(100),
    "estado" VARCHAR(100),
    "calle" VARCHAR(100),
    "numero" INTEGER,
    "cp" INTEGER,
    "municipio" VARCHAR(100),

    CONSTRAINT "pk_restaurante" PRIMARY KEY ("idfranquicia","idrestaurante")
);

-- CreateIndex
CREATE UNIQUE INDEX "platillo_idplatillo_key" ON "platillo"("idplatillo");

-- CreateIndex
CREATE UNIQUE INDEX "restaurante_idrestaurante_key" ON "restaurante"("idrestaurante");

-- AddForeignKey
ALTER TABLE "menu" ADD CONSTRAINT "fk_menu1" FOREIGN KEY ("idrestaurante", "idfranquicia") REFERENCES "restaurante"("idrestaurante", "idfranquicia") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "administrador" ADD CONSTRAINT "fk_admin" FOREIGN KEY ("idrestaurante") REFERENCES "restaurante"("idrestaurante") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cocinero" ADD CONSTRAINT "fk_cocinero1" FOREIGN KEY ("idadmin") REFERENCES "administrador"("idadmin") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cocinero" ADD CONSTRAINT "fk_cocinero2" FOREIGN KEY ("idrestaurante") REFERENCES "restaurante"("idrestaurante") ON DELETE CASCADE ON UPDATE CASCADE;

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
ALTER TABLE "mesero" ADD CONSTRAINT "fk_mesero1" FOREIGN KEY ("idadmin") REFERENCES "administrador"("idadmin") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mesero" ADD CONSTRAINT "fk_mesero2" FOREIGN KEY ("idrestaurante") REFERENCES "restaurante"("idrestaurante") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ordenescliente" ADD CONSTRAINT "fk_oc1" FOREIGN KEY ("idcliente") REFERENCES "cliente"("idcliente") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ordenescliente" ADD CONSTRAINT "fk_oc2" FOREIGN KEY ("idordenenvio") REFERENCES "ordenenvio"("idordenenvio") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ordenescliente" ADD CONSTRAINT "fk_oc3" FOREIGN KEY ("idordennormal") REFERENCES "ordennormal"("idordennormal") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "platillo" ADD CONSTRAINT "fk_paltillo1" FOREIGN KEY ("idmenu", "idrestaurante", "idfranquicia") REFERENCES "menu"("idmenu", "idrestaurante", "idfranquicia") ON DELETE CASCADE ON UPDATE CASCADE;

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
ALTER TABLE "restaurante" ADD CONSTRAINT "fk_restaurante" FOREIGN KEY ("idfranquicia") REFERENCES "franquicia"("idfranquicia") ON DELETE NO ACTION ON UPDATE NO ACTION;
