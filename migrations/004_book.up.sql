CREATE TABLE "book" (
    "id" bigserial NOT NULL,
    "title" varchar NOT NULL,
    "author" bigint NOT NULL,
    "description" varchar NOT NULL,
    "price" float NOT NULL,
    "quantity" bigint NOT NULL,
    "category_id" bigint,  
    CONSTRAINT "pk_books" PRIMARY KEY ("id"),
    CONSTRAINT "fk_category" FOREIGN KEY ("category_id") REFERENCES "category" ("id"),
    CONSTRAINT "fk_author" FOREIGN KEY ("author") REFERENCES "author" ("id"),
    CONSTRAINT "unique_author_title" UNIQUE ("author", "title")
);