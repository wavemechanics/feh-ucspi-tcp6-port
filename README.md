# feh-ucspi-tcp6-port

This repo integrates [feh-ucspi-tcp6](https://www.fehcom.de/ipnet/ucspi-tcp6.html) into the FreeBSD ports system.

The contents of this repo should be visible under `/usr/local/ports/sysutils/feh-ucspi-tcp6`.

Most of the time the ports tree is owned by root, so you may not be able to directly clone this repo into the ports directory.

But some ideas:
* `git clone` as root, or
* create a symlink from the ports tree into a cloned directory in your home, or
* rsync from your home to a poudriere instance somewhere else

I use the third method and it works ok.

Once the `sysutils/feh-ucspi-tcp6` directory is populated, you can treat it as a normal port:

```
# cd /usr/ports/sysutils/feh-ucspi-tcp6
# make install
```

## Depends

[fehQlibs](https://github.com/wavemechanics/fehQlibs-port)

## References

https://www.fehcom.de/ipnet/ucspi-tcp6.html