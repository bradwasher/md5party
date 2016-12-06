# md5party

These are a few scripts that allow files extracted by Bro to be hashed and compared with the [VirusShare MD5 hash dump](https://virusshare.com).

### Install

There's a python script provided that will scrape VirusShare to download all the hashes. After that run `install.sh` and restart Bro. The bro script provided will be appended to `local.bro`.

```bash
$ git clone https://github.com/vesche/md5party
$ python scrape-vs.py
$ sudo bash install.sh
```

The default install location is `/data/md5party`. Files will be extracted to `/data/md5party/extract`. If an extracted files hash is found to be within the VirusShare MD5 hash list, it will appear in `/data/md5party/results.txt`.

### Speed

It takes roughly 20 seconds to compare one file hash to the ~27.5 million hashes from VirusShare.

```bash
$ time bash md5party.sh mimikatz.exe

real  0m18.177s
user  0m18.005s
sys   0m0.166s
```
