// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.28.0

package store

type Book struct {
	ID       int64  `json:"id"`
	Title    string `json:"title"`
	Author   string `json:"author"`
	Quantity int64  `json:"quantity"`
}
