### aarch64-linux-gnu交叉编译ffmpeg-2.0.1

交叉编译ffmpeg-2.0.1 
#### 1.配置编译选项
```
mkdir build
cd build

../configure --prefix=$PWD/__install --enable-static --enable-shared --enable-pthreads --enable-cross-compile --cross-prefix=aarch64-linux-gnu- --cc=aarch64-linux-gnu-gcc --arch=arm  --target-os=linux --disable-asm --optflags=-O0 --disable-programs
```
--disable-asm 取消汇编优化 \
--optflags=-O0 编译器优化取消 \
--disable-programs 取消成cmd的程序 ffplay ffpserver等

./configure出错
```
arm-hismall-linux-gcc is unable to create an executable file.
C compiler test failed.
```
查看config.log  cat config.log 
```
arm-hismall-linux-gcc -mcpu= -c -o /tmp/ffconf.CeiwCD3q.o  /tmp/ffconf.WWJ1LIU1.c 
Assembler messages: 
Error: missing cpu name `' 
Error: unrecognized option -mcpu=
C compiler test failed.
```
修改configure脚本，去除指定cpu行 \
vi configure   查找add_cflags  $cpuflags 然后注释
```
#if [ "$cpu" != generic ]; then
#    add_cflags  $cpuflags
#    add_asflags $cpuflags
#fi
```
#### 2.编译 make 
最后连接时ffserver报错 \
ffserver \
undefined reference to `lrintf' 

考虑不需要使用这个进程，直接使用--disable-programs去除这个的编译，重编及通过了

#### 3.安装 make install
安装完成后，就能在__install目录下看到编译好的库了。

