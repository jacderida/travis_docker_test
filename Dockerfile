FROM rust:1.29.2


RUN addgroup --gid 1000 maidsafe && \
    adduser --uid 1000 --ingroup maidsafe --home /home/maidsafe --shell /bin/sh --disabled-password --gecos "" maidsafe

RUN USER=maidsafe && \
    GROUP=maidsafe && \
    curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.4/fixuid-0.4-linux-amd64.tar.gz | tar -C /usr/local/bin -xzf - && \
    chown root:root /usr/local/bin/fixuid && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid && \
    printf "user: $USER\ngroup: $GROUP\n" > /etc/fixuid/config.yml

RUN apt-get update -y && \
    mkdir /target && \
    chown maidsafe:maidsafe /target && \
    mkdir /usr/src/adder && \
    chown maidsafe:maidsafe /usr/src/adder && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/adder
COPY . .

USER maidsafe:maidsafe
RUN cargo build --target-dir /target
ENTRYPOINT ["fixuid"]
