-- CreateEnum
CREATE TYPE "days" AS ENUM ('A', 'B', 'C', 'D', 'E');

-- CreateTable
CREATE TABLE "divisao" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR NOT NULL,
    "descricao" TEXT NOT NULL,
    "days" INTEGER NOT NULL,

    CONSTRAINT "divisao_pk" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "exercicio" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "musculaturaId" INTEGER NOT NULL,
    "video" TEXT NOT NULL,

    CONSTRAINT "exercicio_pk" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "grupo" (
    "id" SERIAL NOT NULL,
    "treinoId" INTEGER NOT NULL,
    "day" "days",
    "exercicio1" INTEGER NOT NULL,
    "exercicio2" INTEGER NOT NULL,
    "exercicio3" INTEGER NOT NULL,
    "exercicio4" INTEGER NOT NULL,
    "exercicio5" INTEGER,
    "exercicio6" INTEGER,
    "exercicio7" INTEGER,

    CONSTRAINT "grupo_pk" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "musculatura" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "image" TEXT NOT NULL,

    CONSTRAINT "musculatura_pk" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "treino" (
    "id" SERIAL NOT NULL,
    "name" TEXT,
    "userId" INTEGER NOT NULL,
    "divisaoId" INTEGER NOT NULL,

    CONSTRAINT "treino_pk" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "idade" INTEGER NOT NULL,
    "altura" INTEGER NOT NULL,
    "peso" INTEGER NOT NULL,

    CONSTRAINT "user_pk" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "divisao_name_key" ON "divisao"("name");

-- CreateIndex
CREATE UNIQUE INDEX "exercicio_name_key" ON "exercicio"("name");

-- CreateIndex
CREATE UNIQUE INDEX "musculatura_name_key" ON "musculatura"("name");

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- AddForeignKey
ALTER TABLE "exercicio" ADD CONSTRAINT "exercicio_fk0" FOREIGN KEY ("musculaturaId") REFERENCES "musculatura"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "grupo" ADD CONSTRAINT "grupo_fk0" FOREIGN KEY ("treinoId") REFERENCES "treino"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "grupo" ADD CONSTRAINT "grupo_fk2" FOREIGN KEY ("exercicio1") REFERENCES "exercicio"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "grupo" ADD CONSTRAINT "grupo_fk3" FOREIGN KEY ("exercicio2") REFERENCES "exercicio"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "grupo" ADD CONSTRAINT "grupo_fk4" FOREIGN KEY ("exercicio3") REFERENCES "exercicio"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "grupo" ADD CONSTRAINT "grupo_fk5" FOREIGN KEY ("exercicio4") REFERENCES "exercicio"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "grupo" ADD CONSTRAINT "grupo_fk6" FOREIGN KEY ("exercicio5") REFERENCES "exercicio"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "grupo" ADD CONSTRAINT "grupo_fk7" FOREIGN KEY ("exercicio6") REFERENCES "exercicio"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "grupo" ADD CONSTRAINT "grupo_fk8" FOREIGN KEY ("exercicio7") REFERENCES "exercicio"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "treino" ADD CONSTRAINT "treino_fk0" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "treino" ADD CONSTRAINT "treino_fk1" FOREIGN KEY ("divisaoId") REFERENCES "divisao"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
