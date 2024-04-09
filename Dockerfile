# Use build arguments for image tag and version
ARG imageTag
ARG imageVersion

# Use an official Node.js runtime as the base image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

FROM baseimage-${imageTag}:${imageVersion} AS base

# Expose port 5000 to the outside world
EXPOSE 3000

# Define the command to run your app using serve
CMD ["npx", "serve", "-s", "build", "-l", "3000"]
