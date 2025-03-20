

migrate -database postgres://postgres:alaa@localhost:5432/bookstore?sslmode=disable -path ./migrations -verbose up
migrate create -ext sql -dir ./migrations/ (name)
