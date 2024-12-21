FROM golang:1.20 as base

WORKDIR /app

COPY . .

RUN go build -o main .

# distroless image

FROM gcr.io/distroless/base

# Copy the binary from the previous stage
COPY --from=base /app/main .

COPY --from=base /app/static ./static

EXPOSE 8000

CMD ["./main"]
