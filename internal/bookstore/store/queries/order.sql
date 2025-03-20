
-- name: CreateOrder :one
INSERT INTO "order" ("user_id", "status", "total_price", "created_at", "updated_at")
VALUES ($1, $2, $3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
RETURNING *;

-- name: GetAllOrders :many
SELECT * FROM "order";

-- name: GetOrdersByUserID :many
SELECT * FROM "order" WHERE "user_id" = $1;

-- name: UpdateOrderStatus :one
UPDATE "order"
SET "status" = $1, "updated_at" = CURRENT_TIMESTAMP
WHERE "id" = $2
RETURNING *;

-- name: DeleteOrder :exec
DELETE FROM "order" WHERE "id" = $1;