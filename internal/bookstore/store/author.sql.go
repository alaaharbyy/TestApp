// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.25.0
// source: author.sql

package store

import (
	"context"
	"database/sql"
)

const createAuthor = `-- name: CreateAuthor :one
INSERT INTO "author" ("name", "number_of_books", "bio")
VALUES ($1, $2, $3) RETURNING id, name, number_of_books, bio
`

type CreateAuthorParams struct {
	Name          string         `json:"name"`
	NumberOfBooks int64          `json:"number_of_books"`
	Bio           sql.NullString `json:"bio"`
}

func (q *Queries) CreateAuthor(ctx context.Context, arg CreateAuthorParams) (Author, error) {
	row := q.db.QueryRowContext(ctx, createAuthor, arg.Name, arg.NumberOfBooks, arg.Bio)
	var i Author
	err := row.Scan(
		&i.ID,
		&i.Name,
		&i.NumberOfBooks,
		&i.Bio,
	)
	return i, err
}

const deleteAuthor = `-- name: DeleteAuthor :exec
DELETE FROM "author" WHERE "id" = $1
`

func (q *Queries) DeleteAuthor(ctx context.Context, id int64) error {
	_, err := q.db.ExecContext(ctx, deleteAuthor, id)
	return err
}

const getAllAuthors = `-- name: GetAllAuthors :many
SELECT id, name, number_of_books, bio FROM "author"
`

func (q *Queries) GetAllAuthors(ctx context.Context) ([]Author, error) {
	rows, err := q.db.QueryContext(ctx, getAllAuthors)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []Author
	for rows.Next() {
		var i Author
		if err := rows.Scan(
			&i.ID,
			&i.Name,
			&i.NumberOfBooks,
			&i.Bio,
		); err != nil {
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

const getAuthorByID = `-- name: GetAuthorByID :one
SELECT id, name, number_of_books, bio FROM "author" WHERE "id" = $1
`

func (q *Queries) GetAuthorByID(ctx context.Context, id int64) (Author, error) {
	row := q.db.QueryRowContext(ctx, getAuthorByID, id)
	var i Author
	err := row.Scan(
		&i.ID,
		&i.Name,
		&i.NumberOfBooks,
		&i.Bio,
	)
	return i, err
}

const updateAuthor = `-- name: UpdateAuthor :one
UPDATE "author"
SET "number_of_books" = $1, "bio" = $2
WHERE "id" = $3 RETURNING id, name, number_of_books, bio
`

type UpdateAuthorParams struct {
	NumberOfBooks int64          `json:"number_of_books"`
	Bio           sql.NullString `json:"bio"`
	ID            int64          `json:"id"`
}

func (q *Queries) UpdateAuthor(ctx context.Context, arg UpdateAuthorParams) (Author, error) {
	row := q.db.QueryRowContext(ctx, updateAuthor, arg.NumberOfBooks, arg.Bio, arg.ID)
	var i Author
	err := row.Scan(
		&i.ID,
		&i.Name,
		&i.NumberOfBooks,
		&i.Bio,
	)
	return i, err
}
