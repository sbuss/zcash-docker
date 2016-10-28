# zcashd in Docker

To run

```sh
mkdir -p $HOME/.zcash
mkdir -p $HOME/.zcash-params
docker run --rm -it -p18232:18232 -p18233:18233 -p8233:8233 -p8232:8232 -v $HOME/.zcash:/root/.zcash -v $HOME/.zcash-params:/root/.zcash-params sbuss/zcashd
```

Note that you need to mount in your own `$HOME/.zcashd` and `$HOME/.zcash-params`
directories. If you don't, then you'll mine to a wallet that will be wiped out
every time you stop the docker image.

## Building

If you would prefer to build this yourself:

```sh
make zcashd
# then run as usual
docker run --rm -it -v $HOME/.zcash:/root/.zcash -v $HOME/.zcash-params:/root/.zcash-params sbuss/zcashd
```
