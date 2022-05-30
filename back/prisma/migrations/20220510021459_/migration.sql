/*
  Warnings:

  - You are about to drop the column `idusuario` on the `resena` table. All the data in the column will be lost.
  - Added the required column `idcliente` to the `resena` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "resena" DROP CONSTRAINT "fk_resena";

-- AlterTable
ALTER TABLE "resena" DROP COLUMN "idusuario",
ADD COLUMN     "idcliente" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "resena" ADD CONSTRAINT "fk_resena3" FOREIGN KEY ("idcliente") REFERENCES "cliente"("idcliente") ON DELETE NO ACTION ON UPDATE NO ACTION;
