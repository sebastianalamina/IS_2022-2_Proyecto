/*
  Warnings:

  - You are about to drop the `ordenescliente` table. If the table is not empty, all the data it contains will be lost.
  - Made the column `idusuario` on table `cliente` required. This step will fail if there are existing NULL values in that column.

*/

-- DropIndex

-- DropIndex

-- AlterTable
ALTER TABLE "cliente" ALTER COLUMN "idusuario" SET NOT NULL;



-- CreateTable
CREATE TABLE "resena" (
    "idresena" SERIAL NOT NULL,
    "idrestaurante" INTEGER NOT NULL,
    "idusuario" INTEGER NOT NULL,
    "classificacion" INTEGER NOT NULL,

    CONSTRAINT "resena_pkey" PRIMARY KEY ("idresena")
);

-- AddForeignKey
ALTER TABLE "resena" ADD CONSTRAINT "fk_resena2" FOREIGN KEY ("idrestaurante") REFERENCES "restaurante"("idrestaurante") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "resena" ADD CONSTRAINT "fk_resena" FOREIGN KEY ("idusuario") REFERENCES "usuario"("idusuario") ON DELETE NO ACTION ON UPDATE NO ACTION;
