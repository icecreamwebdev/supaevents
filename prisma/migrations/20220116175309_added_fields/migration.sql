/*
  Warnings:

  - The values [Team,Individual] on the enum `sportType` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "sportType_new" AS ENUM ('team', 'individual');
ALTER TABLE "Eventor" ALTER COLUMN "type" TYPE "sportType_new" USING ("type"::text::"sportType_new");
ALTER TABLE "Sport" ALTER COLUMN "type" TYPE "sportType_new" USING ("type"::text::"sportType_new");
ALTER TYPE "sportType" RENAME TO "sportType_old";
ALTER TYPE "sportType_new" RENAME TO "sportType";
DROP TYPE "sportType_old";
COMMIT;

-- AlterTable
ALTER TABLE "Sport" ADD COLUMN     "type" "sportType" NOT NULL DEFAULT E'team';
