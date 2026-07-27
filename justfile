# Cross-platform justfile for dev-tools
# Install just: cargo install just

set dotenv-load := true

# Default recipe - show available commands
default:
    @just --list

build:
    rm -rf dev-tools
    git clone https://github.com/DimetriusJonson/dev-tools.git
    docker buildx build -f Dockerfile_build --output type=local,dest=./target .
    docker build --no-cache -t dev-tools .

build-target:
    rm -rf dev-tools
    git clone https://github.com/DimetriusJonson/dev-tools.git
    docker buildx build -f Dockerfile_build --output type=local,dest=./target .
    
build-final:
    docker build --no-cache -t dev-tools .

run:
    docker run --rm -p 8080:80 dev-tools:latest


