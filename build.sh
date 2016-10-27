#!/bin/bash
if [[ ! -d "/out" ]]; then
    echo "You must mount a local directory to /out"
    exit 1;
fi

/zcash/zcutil/build.sh -j$(nproc)

cp /zcash/src/zcashd /out/
cp /zcash/zcutil/fetch-params.sh /out/
cp /zcash/src/zcash-cli /out/
cp /zcash/src/zcash-tx /out/
