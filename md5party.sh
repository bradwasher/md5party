#!/usr/bin/env bash

h=`md5sum $1 | awk '{ print $1 }'`

grep $h hashes/VirusShare_*.md5 >> /data/md5party/results.txt
