
-- name: CreateBook :one
INSERT INTO "book" ("title", "author", "description", "price", "quantity", "category_id")
VALUES ($1, $2, $3, $4, $5, $6) RETURNING *;

-- name: GetAllBooks :many
SELECT * FROM "book";

-- name: GetBooksByAuthor :many
SELECT * FROM "book" WHERE "author" = $1;

-- name: GetBookByID :one
SELECT * FROM "book" WHERE "id" = $1;

-- name: UpdateBook :one
UPDATE "book"
SET "price" = $1, "quantity" = $2
WHERE "id" = $3
RETURNING *;

-- name: DeleteBook :exec
DELETE FROM "book" WHERE "id" = $1;