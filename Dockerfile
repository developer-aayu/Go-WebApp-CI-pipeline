FROM golang:1.22

WORKDIR /app
COPY . .

# Change ownership to root (if running as root)
RUN chown -R root:root /app

RUN go build -o main .

EXPOSE 8000

CMD ["./main"]
