# Use a base image that includes the necessary utilities
FROM golang:1.22 AS build

# Install Docker CLI
RUN apt-get update && apt-get install -y docker.io && \
    apt-get install -y coreutils

WORKDIR /app

# Install golangci-lint
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.52.2

# Copy your application files
COPY . .

# Build your application
RUN go build -o go-web-app

# Final stage
FROM debian:buster-slim  
# Change this to a base image with necessary utilities

COPY --from=build /app/go-web-app /app/
WORKDIR /app

CMD ["./go-web-app"]
