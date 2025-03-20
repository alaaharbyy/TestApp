package handlers

// Adjust the import path based on your actual project structure

// func SignUp(c *gin.Context) {
// 	var newUser store.CreateUserParams
// 	if err := c.BindJSON(&newUser); err != nil {
// 		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
// 		return
// 	}

// 	// Hash the user's password
// 	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(newUser.Password), bcrypt.DefaultCost)
// 	if err != nil {
// 		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to hash password"})
// 		return
// 	}

// 	// Set the hashed password into the user struct (override the plain text password)
// 	newUser.Password = string(hashedPassword)

// 	// Initialize the queries
// 	queries := store.New(database.DB)

// 	// Insert the new user into the database
// 	user, err := queries.CreateUser(context.Background(), newUser)
// 	if err != nil {
// 		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
// 		return
// 	}

// 	c.JSON(http.StatusCreated, user)
// }

// import (
// 	"context"
// 	"fmt"
// 	"net/http"
// 	"github.com/gin-gonic/gin"
// 	"golang.org/x/crypto/bcrypt"
// 	"github.com/dgrijalva/jwt-go"
// 	"yourapp/store" // Adjust the import path based on your actual project structure
// 	"yourapp/database"
// )

// var JWT_SECRET = []byte("your-secret-key")

// func Login(c *gin.Context) {
// 	var loginDetails struct {
// 		Username string `json:"username"`
// 		Password string `json:"password"`
// 	}

// 	if err := c.BindJSON(&loginDetails); err != nil {
// 		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
// 		return
// 	}

// 	// Initialize the queries
// 	queries := store.New(database.DB)

// 	// Get the user from the database
// 	user, err := queries.GetUserByUsername(context.Background(), loginDetails.Username)
// 	if err != nil {
// 		c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid username or password"})
// 		return
// 	}

// 	// Compare the password with the stored hash
// 	err = bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(loginDetails.Password))
// 	if err != nil {
// 		c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid username or password"})
// 		return
// 	}

// 	// Generate JWT token
// 	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
// 		"id":       user.ID,
// 		"username": user.Username,
// 		"email":    user.Email,
// 	})

// 	tokenString, err := token.SignedString(JWT_SECRET)
// 	if err != nil {
// 		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to generate token"})
// 		return
// 	}

// 	// Respond with the token
// 	c.JSON(http.StatusOK, gin.H{
// 		"token": tokenString,
// 	})
// }
