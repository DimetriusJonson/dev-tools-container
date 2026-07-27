FROM rust:1.97.1-slim AS builder

WORKDIR /work

RUN apt-get update && apt-get install -y \
    pkg-config \
    libssl-dev \
    curl \
    git \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN rustup target add wasm32-unknown-unknown

RUN wget -qO- https://github.com/trunk-rs/trunk/releases/download/v0.21.14/trunk-x86_64-unknown-linux-gnu.tar.gz | tar -xzf- -C /usr/local/bin

RUN git clone https://github.com/DimetriusJonson/dev-tools.git

WORKDIR /work/dev-tools


RUN trunk build --release
RUN cargo build --release --bin server

RUN mkdir build

FROM scratch AS runner

WORKDIR /work

COPY --from=builder /work/dev-tools/dist /work/dist
COPY --from=builder /work/dev-tools/target/release/server /work/server

