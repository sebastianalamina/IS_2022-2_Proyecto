/*
  Warnings:

  - Added the required column `texto` to the `resena` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "resena" ADD COLUMN     "texto" VARCHAR(255) NOT NULL;
