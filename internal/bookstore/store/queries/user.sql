-- name: CreateUser :one
INSERT INTO "user" ("username", "password", "email", "first_name", "last_name", "created_at", "updated_at")
VALUES ($1, $2, $3, $4, $5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
RETURNING *;

-- name: GetAlluser :many
SELECT * FROM "user";

-- name: GetUserByID :one
SELECT * FROM "user" WHERE "id" = $1;

-- name: UpdateUserEmail :one
UPDATE "user"
SET "email" = $1, "updated_at" = CURRENT_TIMESTAMP
WHERE "id" = $2
RETURNING *;

-- name: DeleteUser :exec
DELETE FROM "user" WHERE "id" = $1;
