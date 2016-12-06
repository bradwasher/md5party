# md5party

These are a few scripts that allow files extracted by Bro to be hashed and compared with the [VirusShare MD5 hash dump](https://virusshare.com).

It takes roughly 20 seconds to compare one file hash to the ~27.5 million hashes from VirusShare.
```bash
$ time bash md5party.sh mimikatz.exe

real  0m18.177s
user  0m18.005s
sys   0m0.166s
```
