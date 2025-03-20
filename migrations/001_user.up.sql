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
