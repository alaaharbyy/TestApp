-- name: CreateInvoice :one
INSERT INTO "invoice" ("order_id", "invoice_date", "total_amount", "status", "payment_method")
VALUES ($1, CURRENT_TIMESTAMP, $2, $3, $4)
RETURNING *;

-- name: GetAllInvoices :many
SELECT * FROM "invoice";

-- name: GetInvoiceByOrderID :one
SELECT * FROM "invoice" WHERE "order_id" = $1;

-- name: UpdateInvoiceStatus :one
UPDATE "invoice"
SET "status" = $1
WHERE "id" = $2
RETURNING *;

-- name: DeleteInvoice :exec
DELETE FROM "invoice" WHERE "id" = $1;