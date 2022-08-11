#!/usr/bin/env bash

#
# A script to continue node sync whenever it is stopped.
#

# 1. Mount the disk
# 2. CD to the right folder
# 3. Start node sync
#
#

mediaFolder="/mnt/media"

# Check if the media folder exists, if it does not create it and cd into it.
if [[ -z "$mediaFolder" ]]; then
    echo "Media folder not found, creating it."
    mkdir $mediaFolder
    cd $mediaFolder
else 
    echo "Media folder found, continuing."
    cd $mediaFolder
fi

# Start the node sync
echo "Starting node sync."
./geth_linux --config ./config.toml --datadir ./mainnet --cache 100000 --rpc.allow-unprotected-txs --txlookuplimit 0 --http --maxpeers 100 --ws --syncmode=full --snapshot=false --diffsync

