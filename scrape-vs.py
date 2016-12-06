#!/usr/bin/env python

import os

for n in range(0, 273):

    n = str(n)
    while len(n) != 5:
        n = '0' + n

    os.system("wget https://virusshare.com/hashes/VirusShare_{}.md5 -P hashes/".format(n))
