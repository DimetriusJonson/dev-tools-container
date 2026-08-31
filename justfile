# Cross-platform justfile for dev-tools
# Install just: cargo install just

set dotenv-load := true

# Default recipe - show available commands
default:
    @just --list

build:
    git -C dev-tools pull 
    docker buildx build -f Dockerfile.build --progress=plain --output type=local,dest=./target .
    docker build --no-cache -t dev-tools -f Dockerfile.vercel .

git-pull:
    git -C dev-tools pull

build-target:
    docker buildx build -f Dockerfile.build --progress=plain --output type=local,dest=./target .
    
build-final:
    docker build --no-cache -t dev-tools -f Dockerfile.vercel .

run:
    docker run --rm -p 8080:80 dev-tools:latest


