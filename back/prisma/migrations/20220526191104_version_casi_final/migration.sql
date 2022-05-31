/*
  Warnings:

  - A unique constraint covering the columns `[idusuario]` on the table `administrador` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[idusuario]` on the table `cliente` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[idusuario]` on the table `mesero` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[email]` on the table `usuario` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `idrestaurante` to the `orden` table without a default value. This is not possible if the table is not empty.
  - Made the column `nombre` on table `restaurante` required. This step will fail if there are existing NULL values in that column.
  - Made the column `estado` on table `restaurante` required. This step will fail if there are existing NULL values in that column.
  - Made the column `calle` on table `restaurante` required. This step will fail if there are existing NULL values in that column.
  - Made the column `numero` on table `restaurante` required. This step will fail if there are existing NULL values in that column.
  - Made the column `cp` on table `restaurante` required. This step will fail if there are existing NULL values in that column.
  - Made the column `municipio` on table `restaurante` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "administrador" ALTER COLUMN "idrestaurante" DROP NOT NULL;

-- AlterTable
ALTER TABLE "orden" ADD COLUMN     "idrestaurante" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "platillo" ALTER COLUMN "img" DROP NOT NULL;

-- AlterTable
ALTER TABLE "restaurante" ALTER COLUMN "nombre" SET NOT NULL,
ALTER COLUMN "estado" SET NOT NULL,
ALTER COLUMN "calle" SET NOT NULL,
ALTER COLUMN "numero" SET NOT NULL,
ALTER COLUMN "cp" SET NOT NULL,
ALTER COLUMN "municipio" SET NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "administrador_idusuario_key" ON "administrador"("idusuario");

-- CreateIndex
CREATE UNIQUE INDEX "cliente_idusuario_key" ON "cliente"("idusuario");

-- CreateIndex
CREATE UNIQUE INDEX "mesero_idusuario_key" ON "mesero"("idusuario");

-- CreateIndex
CREATE UNIQUE INDEX "usuario_email_key" ON "usuario"("email");

-- AddForeignKey
ALTER TABLE "orden" ADD CONSTRAINT "fk_orden1" FOREIGN KEY ("idrestaurante") REFERENCES "restaurante"("idrestaurante") ON DELETE CASCADE ON UPDATE CASCADE;
