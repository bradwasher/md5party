#!/usr/bin/env bash

mkdir -p /data/md5party/extract
cp -r hashes/ /data/md5party
cp md5party.sh /data/md5party/
chmod -R 777 /data/md5party

# move md5party-extract.bro into bro directory
