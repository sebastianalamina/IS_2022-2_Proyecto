/*
  Warnings:

  - You are about to drop the column `amaterno` on the `administrador` table. All the data in the column will be lost.
  - You are about to drop the column `apatermo` on the `administrador` table. All the data in the column will be lost.
  - You are about to drop the column `nombre` on the `administrador` table. All the data in the column will be lost.
  - You are about to drop the column `amaterno` on the `cliente` table. All the data in the column will be lost.
  - You are about to drop the column `apatermo` on the `cliente` table. All the data in the column will be lost.
  - You are about to drop the column `calle` on the `cliente` table. All the data in the column will be lost.
  - You are about to drop the column `cp` on the `cliente` table. All the data in the column will be lost.
  - You are about to drop the column `estado` on the `cliente` table. All the data in the column will be lost.
  - You are about to drop the column `municipio` on the `cliente` table. All the data in the column will be lost.
  - You are about to drop the column `nombre` on the `cliente` table. All the data in the column will be lost.
  - You are about to drop the column `numero` on the `cliente` table. All the data in the column will be lost.
  - You are about to drop the column `idordenenvio` on the `contenidoorden` table. All the data in the column will be lost.
  - You are about to drop the column `idordennormal` on the `contenidoorden` table. All the data in the column will be lost.
  - You are about to drop the column `estado` on the `entregadomicilio` table. All the data in the column will be lost.
  - You are about to drop the column `idordenenvio` on the `entregadomicilio` table. All the data in the column will be lost.
  - You are about to drop the column `amaterno` on the `mesero` table. All the data in the column will be lost.
  - You are about to drop the column `apatermo` on the `mesero` table. All the data in the column will be lost.
  - You are about to drop the column `nombre` on the `mesero` table. All the data in the column will be lost.
  - You are about to drop the column `amaterno` on the `repartidor` table. All the data in the column will be lost.
  - You are about to drop the column `apatermo` on the `repartidor` table. All the data in the column will be lost.
  - You are about to drop the column `nombre` on the `repartidor` table. All the data in the column will be lost.
  - You are about to drop the `_carritoTocliente` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `carrito` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `cocinero` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `confirmacionCarrito` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `contenidoCarrito` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `entregamesa` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `inventario` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `modificarCarrito` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ordenenvio` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ordennormal` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `prepararorden` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `registrorestaurante` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[idrestaurante]` on the table `administrador` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `idorden` to the `contenidoorden` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idorden` to the `entregadomicilio` table without a default value. This is not possible if the table is not empty.
  - Added the required column `img` to the `platillo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `confirmado` to the `usuario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nombre` to the `usuario` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "_carritoTocliente" DROP CONSTRAINT "_carritoTocliente_A_fkey";

-- DropForeignKey
ALTER TABLE "_carritoTocliente" DROP CONSTRAINT "_carritoTocliente_B_fkey";

-- DropForeignKey
ALTER TABLE "cocinero" DROP CONSTRAINT "fk_cocinero1";

-- DropForeignKey
ALTER TABLE "cocinero" DROP CONSTRAINT "fk_cocinero2";

-- DropForeignKey
ALTER TABLE "cocinero" DROP CONSTRAINT "fk_usuario";

-- DropForeignKey
ALTER TABLE "confirmacionCarrito" DROP CONSTRAINT "confirmacionCarrito_idcarrito_fkey";

-- DropForeignKey
ALTER TABLE "confirmacionCarrito" DROP CONSTRAINT "fk_cc";

-- DropForeignKey
ALTER TABLE "confirmacionCarrito" DROP CONSTRAINT "fk_cc2";

-- DropForeignKey
ALTER TABLE "contenidoCarrito" DROP CONSTRAINT "contenidoCarrito_idcarrito_fkey";

-- DropForeignKey
ALTER TABLE "contenidoCarrito" DROP CONSTRAINT "contenidoCarrito_idplatillo_fkey";

-- DropForeignKey
ALTER TABLE "contenidoorden" DROP CONSTRAINT "fk_contenido2";

-- DropForeignKey
ALTER TABLE "contenidoorden" DROP CONSTRAINT "fk_contenido1";

-- DropForeignKey
ALTER TABLE "entregadomicilio" DROP CONSTRAINT "fk_or2";

-- DropForeignKey
ALTER TABLE "entregamesa" DROP CONSTRAINT "fk_em1";

-- DropForeignKey
ALTER TABLE "entregamesa" DROP CONSTRAINT "fk_em2";

-- DropForeignKey
ALTER TABLE "inventario" DROP CONSTRAINT "fk_inventario";

-- DropForeignKey
ALTER TABLE "modificarCarrito" DROP CONSTRAINT "modificarCarrito_idcarrito_fkey";

-- DropForeignKey
ALTER TABLE "modificarCarrito" DROP CONSTRAINT "modificarCarrito_idcliente_fkey";

-- DropForeignKey
ALTER TABLE "prepararorden" DROP CONSTRAINT "fk_po1";

-- DropForeignKey
ALTER TABLE "prepararorden" DROP CONSTRAINT "fk_po2";

-- DropForeignKey
ALTER TABLE "prepararorden" DROP CONSTRAINT "fk_po3";

-- DropForeignKey
ALTER TABLE "registrorestaurante" DROP CONSTRAINT "fk_reg1";

-- DropForeignKey
ALTER TABLE "registrorestaurante" DROP CONSTRAINT "fk_reg2";

-- AlterTable
ALTER TABLE "administrador" DROP COLUMN "amaterno",
DROP COLUMN "apatermo",
DROP COLUMN "nombre";

-- AlterTable
ALTER TABLE "cliente" DROP COLUMN "amaterno",
DROP COLUMN "apatermo",
DROP COLUMN "calle",
DROP COLUMN "cp",
DROP COLUMN "estado",
DROP COLUMN "municipio",
DROP COLUMN "nombre",
DROP COLUMN "numero";

-- AlterTable
ALTER TABLE "contenidoorden" DROP COLUMN "idordenenvio",
DROP COLUMN "idordennormal",
ADD COLUMN     "idorden" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "entregadomicilio" DROP COLUMN "estado",
DROP COLUMN "idordenenvio",
ADD COLUMN     "idorden" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "mesero" DROP COLUMN "amaterno",
DROP COLUMN "apatermo",
DROP COLUMN "nombre";

-- AlterTable
ALTER TABLE "platillo" ADD COLUMN     "img" VARCHAR(1000) NOT NULL;

-- AlterTable
ALTER TABLE "repartidor" DROP COLUMN "amaterno",
DROP COLUMN "apatermo",
DROP COLUMN "nombre";

-- AlterTable
ALTER TABLE "usuario" ADD COLUMN     "amaterno" CHAR(100),
ADD COLUMN     "apatermo" CHAR(100),
ADD COLUMN     "calle" VARCHAR(100),
ADD COLUMN     "confirmado" BOOLEAN NOT NULL,
ADD COLUMN     "cp" INTEGER,
ADD COLUMN     "estado" VARCHAR(100),
ADD COLUMN     "municipio" VARCHAR(100),
ADD COLUMN     "nombre" CHAR(100) NOT NULL,
ADD COLUMN     "numero" INTEGER;

-- DropTable
DROP TABLE "_carritoTocliente";

-- DropTable
DROP TABLE "carrito";

-- DropTable
DROP TABLE "cocinero";

-- DropTable
DROP TABLE "confirmacionCarrito";

-- DropTable
DROP TABLE "contenidoCarrito";

-- DropTable
DROP TABLE "entregamesa";

-- DropTable
DROP TABLE "inventario";

-- DropTable
DROP TABLE "modificarCarrito";

-- DropTable
DROP TABLE "ordenenvio";

-- DropTable
DROP TABLE "ordennormal";

-- DropTable
DROP TABLE "prepararorden";

-- DropTable
DROP TABLE "registrorestaurante";

-- CreateTable
CREATE TABLE "orden" (
    "idorden" SERIAL NOT NULL,
    "mesa" TEXT NOT NULL,
    "domicilio" TEXT NOT NULL,
    "estado" "estadoorden" NOT NULL,
    "esCarrito" BOOLEAN NOT NULL,
    "pagado" BOOLEAN NOT NULL,
    "costo" INTEGER NOT NULL,

    CONSTRAINT "orden_pkey" PRIMARY KEY ("idorden")
);

-- CreateTable
CREATE TABLE "mesa" (
    "idmesa" SERIAL NOT NULL,
    "idrestaurante" INTEGER NOT NULL,
    "ocupada" BOOLEAN NOT NULL,

    CONSTRAINT "mesa_pkey" PRIMARY KEY ("idmesa")
);

-- CreateIndex
CREATE UNIQUE INDEX "administrador_idrestaurante_key" ON "administrador"("idrestaurante");

-- AddForeignKey
ALTER TABLE "contenidoorden" ADD CONSTRAINT "fk_contenido1" FOREIGN KEY ("idorden") REFERENCES "orden"("idorden") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "entregadomicilio" ADD CONSTRAINT "fk_or2" FOREIGN KEY ("idorden") REFERENCES "orden"("idorden") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mesa" ADD CONSTRAINT "fk_mesa" FOREIGN KEY ("idrestaurante") REFERENCES "restaurante"("idrestaurante") ON DELETE CASCADE ON UPDATE CASCADE;
