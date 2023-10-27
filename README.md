# SNI aarch64 compiler

Docker image to compile [sni](https://github.com/alttpo/sni) with a very specific configuration.

- for linux `aarch64`
- without tray 
- compatible with raspberry pi running on `debian:buster`

(I need this for my retro gaming setup)

```bash
$ docker build --tag sni-pi-compiler .
$ git clone git@github.com:alttpo/sni.git
$ docker run -it -v ./sni:/sni sni-pi-compiler
$ file ./cmd/sni/sni 
```
