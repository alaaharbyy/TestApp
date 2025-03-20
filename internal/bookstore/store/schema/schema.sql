CREATE TABLE "user" (
    "id" bigserial NOT NULL,
    "username" varchar NOT NULL UNIQUE,
    "password" varchar NOT NULL,
    "email" varchar NOT NULL UNIQUE,
    "first_name" varchar,
    "last_name" varchar,
    "created_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "pk_users" PRIMARY KEY ("id")
);

CREATE TABLE "book" (
    "id" bigserial NOT NULL,
    "title" varchar NOT NULL,
    "author" bigint NOT NULL,
    "description" varchar NOT NULL,
    "price" float NOT NULL,
    "quantity" bigint NOT NULL,
    "category_id" bigint,  
    CONSTRAINT "pk_books" PRIMARY KEY ("id")
);

CREATE TABLE "category" (
    "id" bigserial NOT NULL,
    "name" varchar NOT NULL,
    CONSTRAINT "pk_categories" PRIMARY KEY ("id")
);

CREATE TABLE "author" (
    "id" bigserial NOT NULL,
    "name" varchar NOT NULL,
    "number_of_books" bigint NOT NULL,
    "bio" text, 
    CONSTRAINT "pk_authors" PRIMARY KEY ("id")
);

CREATE TABLE "order" (
    "id" bigserial NOT NULL,
    "user_id" bigint NOT NULL,
    "status" bigint NOT NULL DEFAULT 1,  -- Pending, Shipped, Delivered, etc.
    "total_price" float NOT NULL,  
    "created_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "pk_orders" PRIMARY KEY ("id")
);

CREATE TABLE "order_item" (
    "id" bigserial NOT NULL,
    "order_id" bigint NOT NULL,
    "book_id" bigint NOT NULL,
    "quantity" integer NOT NULL,
    "price" float NOT NULL,  -- Price at the time of purchase (could vary from the current price)
    CONSTRAINT "pk_order_items" PRIMARY KEY ("id")
);

CREATE TABLE "invoice" (
    "id" bigserial NOT NULL,
    "order_id" bigint NOT NULL,
    "invoice_date" timestamp DEFAULT CURRENT_TIMESTAMP,
    "total_amount" float NOT NULL,
    "status" bigint NOT NULL DEFAULT 1,  -- Paid, Unpaid, Refunded, etc.
    "payment_method" varchar,  -- E.g., Credit Card, PayPal, etc.
    CONSTRAINT "pk_invoices" PRIMARY KEY ("id")
);

CREATE TABLE "payment" (
    "id" bigserial NOT NULL,
    "invoice_id" bigint NOT NULL,
    "amount" numeric(10, 2) NOT NULL,
    "payment_date" timestamp DEFAULT CURRENT_TIMESTAMP,
    "payment_method" varchar NOT NULL,  -- E.g., Credit Card, PayPal
    "status" bigint NOT NULL DEFAULT 1,  -- Completed, Pending, Failed, etc.
    CONSTRAINT "pk_payments" PRIMARY KEY ("id")
);

-- Add foreign key constraint for "category_id" in "book"
ALTER TABLE "book"
ADD CONSTRAINT "fk_category"
FOREIGN KEY ("category_id") REFERENCES "category" ("id");

-- Add foreign key constraint for "author" in "book"
ALTER TABLE "book"
ADD CONSTRAINT "fk_author"
FOREIGN KEY ("author") REFERENCES "author" ("id");

-- Add unique constraint for the combination of "author" and "title" in "book"
ALTER TABLE "book"
ADD CONSTRAINT "unique_author_title"
UNIQUE ("author", "title");

-- Add foreign key constraint for "user_id" in "order"
ALTER TABLE "order"
ADD CONSTRAINT "fk_user"
FOREIGN KEY ("user_id") REFERENCES "user" ("id");

-- Add foreign key constraint for "order_id" in "order_item"
ALTER TABLE "order_item"
ADD CONSTRAINT "fk_order"
FOREIGN KEY ("order_id") REFERENCES "order" ("id");

-- Add foreign key constraint for "book_id" in "order_item"
ALTER TABLE "order_item"
ADD CONSTRAINT "fk_book"
FOREIGN KEY ("book_id") REFERENCES "book" ("id");

-- Add foreign key constraint for "order_id" in "invoice"
ALTER TABLE "invoice"
ADD CONSTRAINT "fk_order_invoice"
FOREIGN KEY ("order_id") REFERENCES "order" ("id");

-- Add foreign key constraint for "invoice_id" in "payment"
ALTER TABLE "payment"
ADD CONSTRAINT "fk_invoice_payment"
FOREIGN KEY ("invoice_id") REFERENCES "invoice" ("id");
