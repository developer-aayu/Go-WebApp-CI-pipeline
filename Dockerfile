# Stage 1: Build
FROM golang:1.22 AS builder
WORKDIR /app
COPY . .
RUN go build -o main .

# Stage 2: Run (Use a more inclusive image for debugging)
FROM debian:bookworm-slim
COPY --from=builder /app/main .
COPY --from=builder /app/static /app/static
WORKDIR /app
EXPOSE 8000
ENTRYPOINT ["./main"]