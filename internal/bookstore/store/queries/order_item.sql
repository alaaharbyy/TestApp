
-- name: CreateOrderItem :one
INSERT INTO "order_item" ("order_id", "book_id", "quantity", "price")
VALUES ($1, $2, $3, $4)
RETURNING *;

-- name: GetAllOrderItems :many
SELECT * FROM "order_item";

-- name: GetOrderItemsByOrderID :many
SELECT * FROM "order_item" WHERE "order_id" = $1;

-- name: UpdateOrderItem :one
UPDATE "order_item"
SET "quantity" = $1, "price" = $2
WHERE "id" = $3
RETURNING *;

-- name: DeleteOrderItem :exec
DELETE FROM "order_item" WHERE "id" = $1;