
-- name: CreateCategory :one
INSERT INTO "category" ("name")
VALUES ($1)
RETURNING *;;

-- name: GetAllCategories :many
SELECT * FROM "category";

-- name: GetCategoryByID :one
SELECT * FROM "category" WHERE "id" = $1;

-- name: UpdateCategory :one
UPDATE "category"
SET "name" = $1
WHERE "id" = $2
RETURNING *;

-- name: DeleteCategory :exec
DELETE FROM "category" WHERE "id" = $1;
