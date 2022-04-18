/*
  Warnings:

  - The primary key for the `administrador` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `idadmin` column on the `administrador` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `cliente` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `idcliente` column on the `cliente` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `cocinero` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `idcocinero` column on the `cocinero` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `idordennormal` column on the `contenidoorden` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `idordenenvio` column on the `contenidoorden` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `idplatillo` column on the `contenidoorden` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `franquicia` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `idfranquicia` column on the `franquicia` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `menu` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `mesero` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `idmesero` column on the `mesero` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `ordenenvio` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `idordenenvio` column on the `ordenescliente` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `idordennormal` column on the `ordenescliente` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `ordennormal` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `platillo` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `idplatillo` column on the `platillo` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `idordenenvio` column on the `prepararorden` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `idordennormal` column on the `prepararorden` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `repartidor` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `idrepartidor` column on the `repartidor` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `restaurante` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `idrestaurante` column on the `restaurante` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Changed the type of `idrestaurante` on the `administrador` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `idadmin` on the `cocinero` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `idrestaurante` on the `cocinero` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `idrepartidor` on the `entregadomicilio` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `idordenenvio` on the `entregadomicilio` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `idmesero` on the `entregamesa` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `idordennormal` on the `entregamesa` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `idrestaurante` on the `menu` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `idfranquicia` on the `menu` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `idadmin` on the `mesero` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `idrestaurante` on the `mesero` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `idordenenvio` on the `ordenenvio` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `idcliente` on the `ordenescliente` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `idordennormal` on the `ordennormal` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `idrestaurante` on the `platillo` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `idfranquicia` on the `platillo` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `idcocinero` on the `prepararorden` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `idadmin` on the `registrorestaurante` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `idrestaurante` on the `registrorestaurante` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `idfranquicia` on the `restaurante` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "administrador" DROP CONSTRAINT "fk_admin";

-- DropForeignKey
ALTER TABLE "cocinero" DROP CONSTRAINT "fk_cocinero1";

-- DropForeignKey
ALTER TABLE "cocinero" DROP CONSTRAINT "fk_cocinero2";

-- DropForeignKey
ALTER TABLE "contenidoorden" DROP CONSTRAINT "fk_contenido2";

-- DropForeignKey
ALTER TABLE "contenidoorden" DROP CONSTRAINT "fk_contenido1";

-- DropForeignKey
ALTER TABLE "contenidoorden" DROP CONSTRAINT "fk_contenido3";

-- DropForeignKey
ALTER TABLE "entregadomicilio" DROP CONSTRAINT "fk_or2";

-- DropForeignKey
ALTER TABLE "entregadomicilio" DROP CONSTRAINT "fk_or1";

-- DropForeignKey
ALTER TABLE "entregamesa" DROP CONSTRAINT "fk_em1";

-- DropForeignKey
ALTER TABLE "entregamesa" DROP CONSTRAINT "fk_em2";

-- DropForeignKey
ALTER TABLE "menu" DROP CONSTRAINT "fk_menu1";

-- DropForeignKey
ALTER TABLE "mesero" DROP CONSTRAINT "fk_mesero1";

-- DropForeignKey
ALTER TABLE "mesero" DROP CONSTRAINT "fk_mesero2";

-- DropForeignKey
ALTER TABLE "ordenescliente" DROP CONSTRAINT "fk_oc1";

-- DropForeignKey
ALTER TABLE "ordenescliente" DROP CONSTRAINT "fk_oc2";

-- DropForeignKey
ALTER TABLE "ordenescliente" DROP CONSTRAINT "fk_oc3";

-- DropForeignKey
ALTER TABLE "platillo" DROP CONSTRAINT "fk_paltillo1";

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

-- DropForeignKey
ALTER TABLE "restaurante" DROP CONSTRAINT "fk_restaurante";

-- AlterTable
ALTER TABLE "administrador" DROP CONSTRAINT "pk_admin",
DROP COLUMN "idadmin",
ADD COLUMN     "idadmin" SERIAL NOT NULL,
DROP COLUMN "idrestaurante",
ADD COLUMN     "idrestaurante" INTEGER NOT NULL,
ADD CONSTRAINT "pk_admin" PRIMARY KEY ("idadmin");

-- AlterTable
ALTER TABLE "cliente" DROP CONSTRAINT "pk_cliente",
DROP COLUMN "idcliente",
ADD COLUMN     "idcliente" SERIAL NOT NULL,
ADD CONSTRAINT "pk_cliente" PRIMARY KEY ("idcliente");

-- AlterTable
ALTER TABLE "cocinero" DROP CONSTRAINT "pk_cocinero",
DROP COLUMN "idcocinero",
ADD COLUMN     "idcocinero" SERIAL NOT NULL,
DROP COLUMN "idadmin",
ADD COLUMN     "idadmin" INTEGER NOT NULL,
DROP COLUMN "idrestaurante",
ADD COLUMN     "idrestaurante" INTEGER NOT NULL,
ADD CONSTRAINT "pk_cocinero" PRIMARY KEY ("idcocinero");

-- AlterTable
ALTER TABLE "contenidoorden" DROP COLUMN "idordennormal",
ADD COLUMN     "idordennormal" INTEGER,
DROP COLUMN "idordenenvio",
ADD COLUMN     "idordenenvio" INTEGER,
DROP COLUMN "idplatillo",
ADD COLUMN     "idplatillo" INTEGER;

-- AlterTable
ALTER TABLE "entregadomicilio" DROP COLUMN "idrepartidor",
ADD COLUMN     "idrepartidor" INTEGER NOT NULL,
DROP COLUMN "idordenenvio",
ADD COLUMN     "idordenenvio" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "entregamesa" DROP COLUMN "idmesero",
ADD COLUMN     "idmesero" INTEGER NOT NULL,
DROP COLUMN "idordennormal",
ADD COLUMN     "idordennormal" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "franquicia" DROP CONSTRAINT "pk_franquicia",
DROP COLUMN "idfranquicia",
ADD COLUMN     "idfranquicia" SERIAL NOT NULL,
ADD CONSTRAINT "pk_franquicia" PRIMARY KEY ("idfranquicia");

-- AlterTable
ALTER TABLE "menu" DROP CONSTRAINT "pk_menu",
DROP COLUMN "idrestaurante",
ADD COLUMN     "idrestaurante" INTEGER NOT NULL,
DROP COLUMN "idfranquicia",
ADD COLUMN     "idfranquicia" INTEGER NOT NULL,
ADD CONSTRAINT "pk_menu" PRIMARY KEY ("idmenu", "idrestaurante", "idfranquicia");

-- AlterTable
ALTER TABLE "mesero" DROP CONSTRAINT "pk_mesero",
DROP COLUMN "idmesero",
ADD COLUMN     "idmesero" SERIAL NOT NULL,
DROP COLUMN "idadmin",
ADD COLUMN     "idadmin" INTEGER NOT NULL,
DROP COLUMN "idrestaurante",
ADD COLUMN     "idrestaurante" INTEGER NOT NULL,
ADD CONSTRAINT "pk_mesero" PRIMARY KEY ("idmesero");

-- AlterTable
ALTER TABLE "ordenenvio" DROP CONSTRAINT "pk_oe",
DROP COLUMN "idordenenvio",
ADD COLUMN     "idordenenvio" INTEGER NOT NULL,
ADD CONSTRAINT "pk_oe" PRIMARY KEY ("idordenenvio");

-- AlterTable
ALTER TABLE "ordenescliente" DROP COLUMN "idcliente",
ADD COLUMN     "idcliente" INTEGER NOT NULL,
DROP COLUMN "idordenenvio",
ADD COLUMN     "idordenenvio" INTEGER,
DROP COLUMN "idordennormal",
ADD COLUMN     "idordennormal" INTEGER;

-- AlterTable
ALTER TABLE "ordennormal" DROP CONSTRAINT "pk_on",
DROP COLUMN "idordennormal",
ADD COLUMN     "idordennormal" INTEGER NOT NULL,
ADD CONSTRAINT "pk_on" PRIMARY KEY ("idordennormal");

-- AlterTable
ALTER TABLE "platillo" DROP CONSTRAINT "pk_platillo",
DROP COLUMN "idplatillo",
ADD COLUMN     "idplatillo" SERIAL NOT NULL,
DROP COLUMN "idrestaurante",
ADD COLUMN     "idrestaurante" INTEGER NOT NULL,
DROP COLUMN "idfranquicia",
ADD COLUMN     "idfranquicia" INTEGER NOT NULL,
ADD CONSTRAINT "pk_platillo" PRIMARY KEY ("idplatillo", "idmenu", "idrestaurante", "idfranquicia");

-- AlterTable
ALTER TABLE "prepararorden" DROP COLUMN "idcocinero",
ADD COLUMN     "idcocinero" INTEGER NOT NULL,
DROP COLUMN "idordenenvio",
ADD COLUMN     "idordenenvio" INTEGER,
DROP COLUMN "idordennormal",
ADD COLUMN     "idordennormal" INTEGER;

-- AlterTable
ALTER TABLE "registrorestaurante" DROP COLUMN "idadmin",
ADD COLUMN     "idadmin" INTEGER NOT NULL,
DROP COLUMN "idrestaurante",
ADD COLUMN     "idrestaurante" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "repartidor" DROP CONSTRAINT "pk_repartidor",
DROP COLUMN "idrepartidor",
ADD COLUMN     "idrepartidor" SERIAL NOT NULL,
ADD CONSTRAINT "pk_repartidor" PRIMARY KEY ("idrepartidor");

-- AlterTable
ALTER TABLE "restaurante" DROP CONSTRAINT "pk_restaurante",
DROP COLUMN "idrestaurante",
ADD COLUMN     "idrestaurante" SERIAL NOT NULL,
DROP COLUMN "idfranquicia",
ADD COLUMN     "idfranquicia" INTEGER NOT NULL,
ADD CONSTRAINT "pk_restaurante" PRIMARY KEY ("idfranquicia", "idrestaurante");

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
