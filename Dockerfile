# Start with a base image
FROM golang:1.22 as base

# Set the working directory inside the container
WORKDIR /app

# Copy the go.mod file to the working directory
COPY go.mod ./

# Download all the dependencies
RUN go mod download

# Copy the source code to the working directory
COPY . .

# Build the application and create a binary named main
RUN go build -o main .

#######################################################

# Reduce the image size using multi-stage builds

FROM gcr.io/distroless/base

# Copy the binary from the previous stage
COPY --from=base /app/main .

# Copy the static files from the previous stage as both binary and static files will be used
COPY --from=base /app/static ./static

# Expose the port on which the application will run
EXPOSE 8000

# Command to run the application
CMD ["./main"]