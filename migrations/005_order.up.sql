
CREATE TABLE "order" (
    "id" bigserial NOT NULL,
    "user_id" bigint NOT NULL,
    "status" bigint NOT NULL DEFAULT 1,  -- Pending, Shipped, Delivered, etc.
    "total_price" float NOT NULL,  
    "created_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "pk_orders" PRIMARY KEY ("id"),
    CONSTRAINT "fk_user" FOREIGN KEY ("user_id") REFERENCES "user" ("id")
);