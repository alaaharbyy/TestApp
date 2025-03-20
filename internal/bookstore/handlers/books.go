package handlers

import (
	"context"
	"fmt"
	"net/http"
	"strconv"
	"testapp/internal/bookstore/store"
	"testapp/internal/database"

	"github.com/gin-gonic/gin"
)

func GetBooks(c *gin.Context) {
	queries := store.New(database.DB)
	books, err := queries.GetAllBooks(context.Background())
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, books)
}

func GetBookByID(c *gin.Context) {
	id := c.Param("id")
	val, err := strconv.Atoi(id)
	if err != nil {
		fmt.Println("Error:", err)
		return
	}
	queries := store.New(database.DB)
	book, err := queries.GetBookByID(context.Background(), int64(val))
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"message": "Book not found"})
		return
	}
	c.JSON(http.StatusOK, book)
}

func CreateBook(c *gin.Context) {
	var newBook store.CreateBookParams
	if err := c.BindJSON(&newBook); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	queries := store.New(database.DB)
	book, err := queries.CreateBook(context.Background(), newBook)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusCreated, book)
}
