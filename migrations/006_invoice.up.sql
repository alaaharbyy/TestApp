CREATE TABLE "invoice" (
    "id" bigserial NOT NULL,
    "order_id" bigint NOT NULL,
    "invoice_date" timestamp DEFAULT CURRENT_TIMESTAMP,
    "total_amount" float NOT NULL,
    "status" bigint NOT NULL DEFAULT 1,  -- Paid, Unpaid, Refunded, etc.
    "payment_method" varchar,  -- E.g., Credit Card, PayPal, etc.
    CONSTRAINT "pk_invoices" PRIMARY KEY ("id"),
    CONSTRAINT "fk_order_invoice" FOREIGN KEY ("order_id") REFERENCES "order" ("id")
);
