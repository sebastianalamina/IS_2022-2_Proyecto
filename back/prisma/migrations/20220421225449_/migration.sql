-- AlterTable
ALTER TABLE "cliente" ALTER COLUMN "idusuario" DROP NOT NULL;

-- CreateTable
CREATE TABLE "modificarCarrito" (
    "idcliente" INTEGER NOT NULL,
    "idcarrito" BIGINT NOT NULL
);

-- CreateTable
CREATE TABLE "carrito" (
    "idcarrito" BIGSERIAL NOT NULL,
    "costo" INTEGER NOT NULL,

    CONSTRAINT "carrito_pkey" PRIMARY KEY ("idcarrito")
);

-- CreateTable
CREATE TABLE "contenidoCarrito" (
    "idcarrito" BIGINT NOT NULL,
    "idplatillo" INTEGER NOT NULL,
    "idcontenidocarrito" BIGSERIAL NOT NULL,

    CONSTRAINT "contenidoCarrito_pkey" PRIMARY KEY ("idcontenidocarrito")
);

-- CreateTable
CREATE TABLE "confirmacionCarrito" (
    "idcarrito" BIGINT NOT NULL,
    "idordenenvio" INTEGER NOT NULL,
    "idordennormal" INTEGER NOT NULL,
    "metodopago" CHAR(18) NOT NULL
);

-- CreateTable
CREATE TABLE "_carritoTocliente" (
    "A" BIGINT NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "modificarCarrito_idcliente_key" ON "modificarCarrito"("idcliente");

-- CreateIndex
CREATE UNIQUE INDEX "modificarCarrito_idcarrito_key" ON "modificarCarrito"("idcarrito");

-- CreateIndex
CREATE UNIQUE INDEX "confirmacionCarrito_idcarrito_key" ON "confirmacionCarrito"("idcarrito");

-- CreateIndex
CREATE UNIQUE INDEX "confirmacionCarrito_idordenenvio_key" ON "confirmacionCarrito"("idordenenvio");

-- CreateIndex
CREATE UNIQUE INDEX "confirmacionCarrito_idordennormal_key" ON "confirmacionCarrito"("idordennormal");

-- CreateIndex
CREATE UNIQUE INDEX "_carritoTocliente_AB_unique" ON "_carritoTocliente"("A", "B");

-- CreateIndex
CREATE INDEX "_carritoTocliente_B_index" ON "_carritoTocliente"("B");

-- AddForeignKey
ALTER TABLE "modificarCarrito" ADD CONSTRAINT "modificarCarrito_idcliente_fkey" FOREIGN KEY ("idcliente") REFERENCES "cliente"("idcliente") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "modificarCarrito" ADD CONSTRAINT "modificarCarrito_idcarrito_fkey" FOREIGN KEY ("idcarrito") REFERENCES "carrito"("idcarrito") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contenidoCarrito" ADD CONSTRAINT "contenidoCarrito_idcarrito_fkey" FOREIGN KEY ("idcarrito") REFERENCES "carrito"("idcarrito") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contenidoCarrito" ADD CONSTRAINT "contenidoCarrito_idplatillo_fkey" FOREIGN KEY ("idplatillo") REFERENCES "platillo"("idplatillo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "confirmacionCarrito" ADD CONSTRAINT "fk_cc" FOREIGN KEY ("idordenenvio") REFERENCES "ordenenvio"("idordenenvio") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "confirmacionCarrito" ADD CONSTRAINT "confirmacionCarrito_idcarrito_fkey" FOREIGN KEY ("idcarrito") REFERENCES "carrito"("idcarrito") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "confirmacionCarrito" ADD CONSTRAINT "fk_cc2" FOREIGN KEY ("idordennormal") REFERENCES "ordennormal"("idordennormal") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_carritoTocliente" ADD FOREIGN KEY ("A") REFERENCES "carrito"("idcarrito") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_carritoTocliente" ADD FOREIGN KEY ("B") REFERENCES "cliente"("idcliente") ON DELETE CASCADE ON UPDATE CASCADE;
