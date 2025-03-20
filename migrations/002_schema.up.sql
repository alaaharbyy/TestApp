
CREATE TABLE "author" (
    "id" bigserial   NOT NULL,
	"name" varchar     NOT NULL,
	"number_of_books" bigint     NOT NULL,
    CONSTRAINT "pk_author" PRIMARY KEY (
        "id"
    )
);
