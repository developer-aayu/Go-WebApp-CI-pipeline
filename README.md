# Go Web App CI Pipeline

Welcome to the Go Web App CI Pipeline repository! This project demonstrates a fully automated Continuous Integration (CI) pipeline for a Go web application using Jenkins and Docker. 

## Project Overview

This repository contains a Go web application that is containerized and managed through a Jenkins pipeline. The pipeline automates the build, test, and deployment processes, ensuring efficient and reliable delivery of the application.

## Features

- **Code Checkout:** Automatically pulls the latest code from GitHub.
- **Build Go Binary:** Compiles the Go application into a binary executable.
- **Unit Testing:** Executes unit tests to verify code functionality and correctness.
- **Code Quality Analysis:** Integrates `golangci-lint` for code quality checks.
- **Docker Integration:**
  - **Build Docker Image:** Creates a Docker image of the Go application.
  - **Push Docker Image:** Pushes the Docker image to Docker Hub.
- **Cleanup:** Removes old Docker images and containers to maintain a clean environment.
- **Email Notifications:** Sends email notifications on build success or failure.

## Setup Instructions

### Prerequisites

- **Jenkins:** Ensure Jenkins is installed and running. [Jenkins Installation Guide](https://www.jenkins.io/doc/book/installing/)
- **Docker:** Install Docker to build and run containers. [Docker Installation Guide](https://docs.docker.com/get-docker/)
- **GitHub:** Set up a GitHub repository for code management.

### Configuration

1. **Install Required Jenkins Plugins:**
   - Docker Pipeline
   - Email Extension Plugin

2. **Configure Jenkins:**
   - **Global Email Configuration:** Set up the SMTP server details for email notifications.
   - **Docker Credentials:** Add your Docker Hub credentials in Jenkins.

3. **Set Up ngrok (For Local Jenkins):**
   - Download and install ngrok.
   - Run `ngrok http 8080` to expose your local Jenkins server.

4. **GitHub Webhooks:**
   - Go to your GitHub repository settings.
   - Add a webhook with the URL provided by ngrok (e.g., `https://<ngrok-id>.ngrok-free.app/github-webhook/`).

### Jenkins Pipeline Configuration

- **Jenkinsfile:** This file defines the CI pipeline stages:
  - **Checkout Stage:** Retrieves the code from the GitHub repository.
  - **Build Stage:** Compiles the Go binary.
  - **Test Stage:** Runs unit tests.
  - **Code Quality Stage:** Performs code quality analysis.
  - **Docker Stage:** Builds and pushes Docker images.
  - **Cleanup Stage:** Prunes unused Docker images and containers.
  - **Post Actions:** Sends email notifications on build success or failure.

### Running the Pipeline

1. **Commit Changes:** Push changes to your GitHub repository.
2. **Webhook Trigger:** The GitHub webhook triggers the Jenkins pipeline automatically.
3. **Pipeline Execution:** Jenkins executes the pipeline stages, performs tests, builds, and deploys the application.

### Troubleshooting

- **Email Notifications:** Ensure SMTP settings in Jenkins are correct.
- **Docker Issues:** Verify Docker setup and credentials.
- **ngrok:** Check if ngrok is running and the URL is correct.

## Acknowledgments

- [Jenkins](https://www.jenkins.io/)
- [Docker](https://www.docker.com/)
- [GitHub](https://github.com/)
- [ngrok](https://ngrok.com/)
- [golangci-lint](https://golangci-lint.run/)

Feel free to fork this repository and contribute to improving the CI pipeline. For any questions or feedback, open an issue or contact me directly.

Happy coding!

