FROM rust:1.29.2

RUN apt-get update -y && \
    mkdir /target && \
    mkdir /usr/src/adder && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/adder
COPY . .

RUN cargo build
