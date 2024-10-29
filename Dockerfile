# Build stage
FROM golang:1.22 AS builder

WORKDIR /app

# Copy go mod files
COPY go.mod go.sum ./
RUN go mod download

# Copy source code
COPY . .

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -o main .

# Final stage
FROM golang:1.22

WORKDIR /app

# Copy the binary from builder
COPY --from=builder /app/main .

# Expose the port your server runs on
EXPOSE 8080

# Run the binary
ENTRYPOINT ["go", "run", "main.go"]
