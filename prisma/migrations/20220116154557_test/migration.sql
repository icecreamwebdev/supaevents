-- CreateEnum
CREATE TYPE "Region" AS ENUM ('us', 'uk', 'aus');

-- CreateTable
CREATE TABLE "Ch" (
    "chID" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "region" "Region" NOT NULL DEFAULT E'us',
    "affLink" TEXT,
    "imgUrl" TEXT NOT NULL,
    "description" TEXT,
    "eventorEID" INTEGER,

    CONSTRAINT "Ch_pkey" PRIMARY KEY ("chID")
);

-- CreateTable
CREATE TABLE "Eventor" (
    "eID" SERIAL NOT NULL,
    "type" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "imgUrl" TEXT,
    "sportSID" INTEGER,
    "leagueLID" INTEGER,
    "eventEID" INTEGER,

    CONSTRAINT "Eventor_pkey" PRIMARY KEY ("eID")
);

-- CreateTable
CREATE TABLE "League" (
    "lID" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "imgUrl" TEXT,
    "sportSID" INTEGER,

    CONSTRAINT "League_pkey" PRIMARY KEY ("lID")
);

-- CreateTable
CREATE TABLE "Sport" (
    "sID" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "ImgUrl" TEXT,

    CONSTRAINT "Sport_pkey" PRIMARY KEY ("sID")
);

-- CreateTable
CREATE TABLE "Event" (
    "eID" SERIAL NOT NULL,
    "type" TEXT NOT NULL,
    "ImgUrl" TEXT,
    "sTime" TIMESTAMP(3) NOT NULL,
    "eTime" TIMESTAMP(3) NOT NULL,
    "isFeatured" BOOLEAN NOT NULL,
    "sportSID" INTEGER,
    "leagueLID" INTEGER,

    CONSTRAINT "Event_pkey" PRIMARY KEY ("eID")
);

-- CreateIndex
CREATE UNIQUE INDEX "Ch_title_key" ON "Ch"("title");

-- CreateIndex
CREATE UNIQUE INDEX "League_title_key" ON "League"("title");

-- CreateIndex
CREATE UNIQUE INDEX "Sport_title_key" ON "Sport"("title");

-- AddForeignKey
ALTER TABLE "Ch" ADD CONSTRAINT "Ch_eventorEID_fkey" FOREIGN KEY ("eventorEID") REFERENCES "Eventor"("eID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Eventor" ADD CONSTRAINT "Eventor_sportSID_fkey" FOREIGN KEY ("sportSID") REFERENCES "Sport"("sID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Eventor" ADD CONSTRAINT "Eventor_leagueLID_fkey" FOREIGN KEY ("leagueLID") REFERENCES "League"("lID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Eventor" ADD CONSTRAINT "Eventor_eventEID_fkey" FOREIGN KEY ("eventEID") REFERENCES "Event"("eID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "League" ADD CONSTRAINT "League_sportSID_fkey" FOREIGN KEY ("sportSID") REFERENCES "Sport"("sID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Event" ADD CONSTRAINT "Event_sportSID_fkey" FOREIGN KEY ("sportSID") REFERENCES "Sport"("sID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Event" ADD CONSTRAINT "Event_leagueLID_fkey" FOREIGN KEY ("leagueLID") REFERENCES "League"("lID") ON DELETE SET NULL ON UPDATE CASCADE;
