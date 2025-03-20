-- name: CreatePayment :one
INSERT INTO "payment" ("invoice_id", "amount", "payment_date", "payment_method", "status")
VALUES ($1, $2, CURRENT_TIMESTAMP, $3, $4)
RETURNING *;

-- name: GetAllPayments :many
SELECT * FROM "payment";

-- name: GetPaymentsByInvoiceID :many
SELECT * FROM "payment" WHERE "invoice_id" = $1;

-- name: UpdatePaymentStatus :one
UPDATE "payment"
SET "status" = $1
WHERE "id" = $2
RETURNING *;

-- name: DeletePayment :exec
DELETE FROM "payment" WHERE "id" = $1;