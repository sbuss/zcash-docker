#!/bin/bash
if [[ ! -d "$HOME/.zcash" || ! -d "$HOME/.zcash-params" ]]; then
    echo "You must mount your \$HOME/.zcash and \$HOME/.zcash-params directories "
    echo "in this container. For example:"
    echo "docker run --rm -it -v \$HOME/.zcash:$HOME/.zcash -v \$HOME/.zcash-params:$HOME/.zcash-params sbuss/zcashd"
    echo ""
    echo "If those directories don't exist on your machine yet, create them and"
    echo "mount the empty directories"
    exit 1
fi

if [[ ! -f "$HOME/.zcash-params/beta2-proving.key" ]]; then
    echo "No params found, fetching them"
    chmod +x $HOME/zcash/fetch-params.sh
    $HOME/zcash/fetch-params.sh || exit 1
fi

$HOME/zcash/zcashd $@
