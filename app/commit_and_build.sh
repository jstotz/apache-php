#!/bin/bash

set -e # Exit on error

# Environment variables
IMAGE_REPO="my-repo"
IMAGE_NAME="my-image"

# Step 1: Make a trivial change to README.md
CHANGE_MSG="Automated update: $(date)"
printf "\n%s\n" "$CHANGE_MSG" >>README.md

git add README.md
git commit -m "$CHANGE_MSG"
git push origin "$(git branch --show-current)"

# Step 2: Get full Git commit SHA
COMMIT_SHA=$(git rev-parse HEAD)

printf "Building Docker image with tag: %s\n" "$COMMIT_SHA"

# Step 3: Build Docker image
docker build -t "$IMAGE_REPO/$IMAGE_NAME:$COMMIT_SHA" .

# Step 4: Wait for user confirmation
printf "Docker image built: %s/%s:%s\n" "$IMAGE_REPO" "$IMAGE_NAME" "$COMMIT_SHA"
read -r -p "Press Enter to push the Docker image or Ctrl+C to cancel..."

# Step 5: Push Docker image
docker push "$IMAGE_REPO/$IMAGE_NAME:$COMMIT_SHA"

printf "Docker image pushed successfully!\n"
