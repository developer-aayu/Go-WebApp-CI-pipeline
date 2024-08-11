# Use the official Go image as the base image
FROM golang:1.22 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the go.mod and go.sum files to the working directory
COPY go.mod go.sum ./

# Download all the dependencies
RUN go mod download

# Copy the source code to the working directory
COPY . .

# Build the application and create a binary named main
RUN go build -o go-web-app .

# Create a new stage for Docker installation and runtime
FROM docker:23.0.0-dind

# Install Docker CLI
RUN apk add --no-cache curl && \
    curl -fsSL https://get.docker.com | sh

# Install necessary packages for running Go app and Docker
RUN apk add --no-cache bash git

# Create a directory for the app
WORKDIR /app

# Copy the Go application binary from the build stage
COPY --from=build /app/go-web-app .

# Expose the port on which the application will run
EXPOSE 8000

# Set the entrypoint to the Go application
ENTRYPOINT ["./go-web-app"]