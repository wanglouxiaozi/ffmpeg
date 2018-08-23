#!/bin/sh

../configure --prefix=$PWD/__install --enable-static --enable-shared --enable-pthreads --enable-cross-compile --cross-prefix=aarch64-linux-gnu- --cc=aarch64-linux-gnu-gcc --arch=arm --disable-asm --target-os=linux --optflags=-O0 --disable-programs 
