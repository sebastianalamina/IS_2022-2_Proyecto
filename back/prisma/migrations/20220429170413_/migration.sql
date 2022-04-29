/*
  Warnings:

  - Added the required column `date` to the `resena` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "resena" ADD COLUMN     "date" DATE NOT NULL;
