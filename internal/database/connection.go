package database

import (
	"database/sql"
	"log"

	_ "github.com/jackc/pgx/v5/stdlib"
)

var DB *sql.DB

func InitDB() {
	var err error
	DB, err = sql.Open("pgx", "postgresql://postgres:alaa@localhost:5432/bookstore?sslmode=disable")
	if err != nil {
		log.Fatal("Failed to connect to database:", err)
	}

	if err := DB.Ping(); err != nil {
		log.Fatal("Database is not reachable:", err)
	}
}
