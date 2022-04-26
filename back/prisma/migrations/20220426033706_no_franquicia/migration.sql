/*
  Warnings:

  - You are about to drop the column `apatermo` on the `cocinero` table. All the data in the column will be lost.
  - You are about to drop the column `idfranquicia` on the `menu` table. All the data in the column will be lost.
  - You are about to drop the column `idfranquicia` on the `platillo` table. All the data in the column will be lost.
  - You are about to drop the column `idfranquicia` on the `restaurante` table. All the data in the column will be lost.
  - You are about to drop the `franquicia` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "restaurante" DROP CONSTRAINT "fk_restaurante";

-- AlterTable
ALTER TABLE "cocinero" DROP COLUMN "apatermo",
ADD COLUMN     "apaterno" CHAR(100);

-- AlterTable
ALTER TABLE "menu" DROP COLUMN "idfranquicia";

-- AlterTable
ALTER TABLE "platillo" DROP COLUMN "idfranquicia";

-- AlterTable
ALTER TABLE "restaurante" DROP COLUMN "idfranquicia";

-- DropTable
DROP TABLE "franquicia";
