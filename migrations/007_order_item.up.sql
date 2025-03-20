
CREATE TABLE "order_item" (
    "id" bigserial NOT NULL,
    "order_id" bigint NOT NULL,
    "book_id" bigint NOT NULL,
    "quantity" integer NOT NULL,
    "price" float NOT NULL,  -- Price at the time of purchase (could vary from the current price)
    CONSTRAINT "pk_order_items" PRIMARY KEY ("id"),
    CONSTRAINT "fk_order" FOREIGN KEY ("order_id") REFERENCES "order" ("id"),
    CONSTRAINT "fk_book" FOREIGN KEY ("book_id") REFERENCES "book" ("id")
);