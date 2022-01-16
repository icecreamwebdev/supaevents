/*
  Warnings:

  - Changed the type of `type` on the `Eventor` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "sportType" AS ENUM ('Team', 'Individual');

-- AlterTable
ALTER TABLE "Ch" ADD COLUMN     "eventEID" INTEGER;

-- AlterTable
ALTER TABLE "Eventor" DROP COLUMN "type",
ADD COLUMN     "type" "sportType" NOT NULL;

-- AddForeignKey
ALTER TABLE "Ch" ADD CONSTRAINT "Ch_eventEID_fkey" FOREIGN KEY ("eventEID") REFERENCES "Event"("eID") ON DELETE SET NULL ON UPDATE CASCADE;
