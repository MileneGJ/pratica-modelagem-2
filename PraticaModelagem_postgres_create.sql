CREATE DATABASE "PraticaModelagem"
\c "PraticaModelagem"

CREATE TABLE "public.Users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "Users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


CREATE TYPE "categoryType" AS ENUM ('camisetas', 'calças', 'vestidos', 'roupa-interior', 'acessórios');
CREATE TYPE "sizeType" AS ENUM ('PP', 'P', 'M', 'G', 'GG');

CREATE TABLE "public.Products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" integer NOT NULL,
	"images" TEXT[] NOT NULL,
	"mainImage" TEXT NOT NULL,
	"category" "categoryType" NOT NULL,
	"size" "sizeType" NOT NULL,
	CONSTRAINT "Products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


CREATE TYPE "statusType" AS ENUM ('created', 'paid', 'delivered', 'cancelled');

CREATE TABLE "public.Purchase" (
	"id" serial NOT NULL,
	"userId" integer NOT NULL,
	"ProductsId" integer[] NOT NULL,
	"quantities" integer[] NOT NULL,
	"status" "statusType" NOT NULL,
	"purchaseDate" TIMESTAMP NOT NULL,
	"streetName" TEXT NOT NULL,
	"streetNumber" TEXT NOT NULL,
	"complement" TEXT NOT NULL,
	"postalCode" TEXT NOT NULL,
	CONSTRAINT "Purchase_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "Purchase" ADD CONSTRAINT "Purchase_fk0" FOREIGN KEY ("userId") REFERENCES "Users"("id");
ALTER TABLE "Purchase" ADD CONSTRAINT "Purchase_fk1" FOREIGN KEY ("ProductsId") REFERENCES "Products"("id");




