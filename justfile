# Cross-platform justfile for dev-tools
# Install just: cargo install just

set dotenv-load := true

# Default recipe - show available commands
default:
    @just --list

build-target:
    docker buildx build -f Dockerfile_build --output type=local,dest=./target .
    
build-final:
    docker build -t dev-tools .

run:
    docker run --rm -p 8080:80 dev-tools:latest


