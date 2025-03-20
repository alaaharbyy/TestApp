
CREATE TABLE "order" (
    "id" bigserial   NOT NULL,
	"order_name" varchar     NOT NULL,
    CONSTRAINT "pk_order" PRIMARY KEY (
        "id"
    )
);
