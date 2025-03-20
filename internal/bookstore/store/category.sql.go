// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.25.0
// source: category.sql

package store

import (
	"context"
)

const createCategory = `-- name: CreateCategory :one
INSERT INTO "category" ("name")
VALUES ($1)
RETURNING id, name
`

func (q *Queries) CreateCategory(ctx context.Context, name string) (Category, error) {
	row := q.db.QueryRowContext(ctx, createCategory, name)
	var i Category
	err := row.Scan(&i.ID, &i.Name)
	return i, err
}

const deleteCategory = `-- name: DeleteCategory :exec
DELETE FROM "category" WHERE "id" = $1
`

func (q *Queries) DeleteCategory(ctx context.Context, id int64) error {
	_, err := q.db.ExecContext(ctx, deleteCategory, id)
	return err
}

const getAllCategories = `-- name: GetAllCategories :many
SELECT id, name FROM "category"
`

func (q *Queries) GetAllCategories(ctx context.Context) ([]Category, error) {
	rows, err := q.db.QueryContext(ctx, getAllCategories)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []Category
	for rows.Next() {
		var i Category
		if err := rows.Scan(&i.ID, &i.Name); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Close(); err != nil {
		return nil, err
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}

const getCategoryByID = `-- name: GetCategoryByID :one
SELECT id, name FROM "category" WHERE "id" = $1
`

func (q *Queries) GetCategoryByID(ctx context.Context, id int64) (Category, error) {
	row := q.db.QueryRowContext(ctx, getCategoryByID, id)
	var i Category
	err := row.Scan(&i.ID, &i.Name)
	return i, err
}

const updateCategory = `-- name: UpdateCategory :one
UPDATE "category"
SET "name" = $1
WHERE "id" = $2
RETURNING id, name
`

type UpdateCategoryParams struct {
	Name string `json:"name"`
	ID   int64  `json:"id"`
}

func (q *Queries) UpdateCategory(ctx context.Context, arg UpdateCategoryParams) (Category, error) {
	row := q.db.QueryRowContext(ctx, updateCategory, arg.Name, arg.ID)
	var i Category
	err := row.Scan(&i.ID, &i.Name)
	return i, err
}
