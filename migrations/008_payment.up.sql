CREATE TABLE "payment" (
    "id" bigserial NOT NULL,
    "invoice_id" bigint NOT NULL,
    "amount" numeric(10, 2) NOT NULL,
    "payment_date" timestamp DEFAULT CURRENT_TIMESTAMP,
    "payment_method" varchar NOT NULL,  -- E.g., Credit Card, PayPal
    "status" bigint NOT NULL DEFAULT 1,  -- Completed, Pending, Failed, etc.
    CONSTRAINT "pk_payments" PRIMARY KEY ("id"),
    CONSTRAINT "fk_invoice_payment" FOREIGN KEY ("invoice_id") REFERENCES "invoice" ("id")
);