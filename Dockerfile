FROM debian:jessie

ARG VERSION=1.0.0
ARG SHA256HASH=cfedf1a4701cf05f8e8a9ff4da0f887bcb2b3bbdcd7631e9cfdeebb6dff01c72

RUN apt-get update && \
    apt-get install -y wget ca-certificates && \
    apt-get clean && \

    wget https://www.bitcoinunlimited.info/downloads/bitcoinUnlimited-${VERSION}-linux64.tar.gz && \
    echo "${SHA256HASH} bitcoinUnlimited-${VERSION}-linux64.tar.gz" | sha256sum -c - && \
    tar -xzvf bitcoinUnlimited-${VERSION}-linux64.tar.gz -C /usr/local --strip-components=1 && \
    rm bitcoinUnlimited-${VERSION}-linux64.tar.gz

VOLUME /var/bitcoin
EXPOSE 8333

ENTRYPOINT ["bitcoind", "-server", "-printtoconsole", "-datadir=/var/bitcoin", \
            "-dbcache=4000", "-whitelist=255.255.255.0", "-rpcallowip=0.0.0.0/0", \
            "-rpcuser=bitcoin", "-rpcpassword=SetYourRpcPassHere"]
