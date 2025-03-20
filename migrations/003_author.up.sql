CREATE TABLE "author" (
    "id" bigserial NOT NULL,
    "name" varchar NOT NULL,
    "number_of_books" bigint NOT NULL,
    "bio" text, 
    CONSTRAINT "pk_authors" PRIMARY KEY ("id")
);