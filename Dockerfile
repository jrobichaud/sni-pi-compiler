FROM --platform=linux/arm64 debian:bullseye

ADD https://go.dev/dl/go1.20.10.linux-arm64.tar.gz .
# install go
RUN tar -C /usr/local -xzf go1.20.10.linux-arm64.tar.gz && rm go1.20.10.linux-arm64.tar.gz

ENV PATH="$PATH:/usr/local/go/bin"

RUN apt-get update && \
    apt-get install -y gcc gcc-aarch64-linux-gnu binutils-aarch64-linux-gnu ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /sni

CMD CGO_ENABLED=1 GOOS=linux GOARCH=arm64 CC="aarch64-linux-gnu-gcc" go build \
    -tags="notray" \
    -gcflags=all=-l \
    -ldflags="-w" \
    -o ./cmd/sni/sni \
    ./cmd/sni
