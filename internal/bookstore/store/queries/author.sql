-- name: CreateAuthor :one
INSERT INTO "author" ("name", "number_of_books", "bio")
VALUES ($1, $2, $3) RETURNING *;

-- name: GetAllAuthors :many
SELECT * FROM "author";

-- name: GetAuthorByID :one
SELECT * FROM "author" WHERE "id" = $1;

-- name: UpdateAuthor :one
UPDATE "author"
SET "number_of_books" = $1, "bio" = $2
WHERE "id" = $3 RETURNING *;

-- name: DeleteAuthor :exec
DELETE FROM "author" WHERE "id" = $1;