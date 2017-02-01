# Minimal Bitcoin Unlimited Dockerfile

Docker is awesome for running a BU node, but at the same time, I always felt
very ambivalent about trusting bitcoin software being delivered by a 3rd party.
What if they sneak in some kind of back door into my client?

The goal with this project is to provide a Dockerfile so simple that you can
read it and believe it to be valid. You can then build your own docker image
using the following steps:

    git clone https://github.com/Garoth/minimal-bitcoin-unlimited-docker.git
    cd minimal-bitcoin-unlimited-docker
    docker build -t minimal-bitcoin-unlimited .
    docker image save minimal-bitcoin-unlimited | gzip > minimal-bitcoin-unlimited.tar.gz

Congrats, now you have a docker archive created. You can generally import this
archive wherever you want. For example, my Network Attached Storage server has
support for containers, so I just imported it there using the web UI.

### About bitcoin-cli

The config I provide sets up bitcoind such that it will provide access locally
(only) using bitcoin-cli. You can configure your username and password in the
ENTRYPOINT line. After you have your docker running, connect a shell to it.
You should now be able to use it as normal. Give it a shot:

    bitcoin-cli -rpcuser=bitcoin -rpcpassword=SetYourRpcPassHere getinfo  

### Notes

Credit to https://gist.github.com/nyanloutre/9015e60a00a5dfcc113d1d32386ae382
for the original script that I worked from.

❤ BU Team. Would be nice to have an official docker + vm image delivered
securely from your site. Hint hint.
