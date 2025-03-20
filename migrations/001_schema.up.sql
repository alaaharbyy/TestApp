
CREATE TABLE "books" (
    "id" bigserial   NOT NULL,
	"title" varchar     NOT NULL,
	"author" varchar     NOT NULL,
    "quantity" bigint NOT NULL,
    CONSTRAINT "pk_fbooks" PRIMARY KEY (
        "id"
    )
);
