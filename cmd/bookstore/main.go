package main

import (
	"testapp/internal/bookstore/handlers"
	"testapp/internal/database"

	"github.com/gin-gonic/gin"
)

func main() {
	database.InitDB()

	router := gin.Default()
	router.GET("/books", handlers.GetBooks)
	router.GET("/books/:id", handlers.GetBookByID)
	router.POST("/books", handlers.CreateBook)
	router.PATCH("/checkout", handlers.CheckoutBook)
	router.PATCH("/return", handlers.ReturnBook)

	router.Run("localhost:8050")
}
