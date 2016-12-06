#!/usr/bin/env bash

mkdir -p /data/md5party/extract
cp -r hashes/ /data/md5party
cp md5party.sh /data/md5party/
chmod -R 777 /data/md5party

cat md5party-extract.bro >> /usr/local/bro/share/bro/site/local.bro
