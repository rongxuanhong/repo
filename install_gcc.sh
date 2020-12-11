#! /bin/bash
#git clone https://github.com/gcc-mirror/gcc.git
GCC_PATH='/home/hrx/gcc-9.3.0'
cd $GCC_PATH

if [ ! -d 'mpfr' ];then
	wget https://mirrors.tuna.tsinghua.edu.cn/gnu/mpfr/mpfr-4.0.2.tar.gz
	tar -zxvf mpfr-4.0.2.tar.gz && mv mpfr-4.0.2 mpfr && rm -f mpfr-4.0.2.tar.gz
fi

if [ ! -d 'mpc' ];then
	wget https://mirrors.tuna.tsinghua.edu.cn/gnu/mpc/mpc-1.1.0.tar.gz
	tar -zxvf mpc-1.1.0.tar.gz && mv mpc-1.1.0 mpc && rm -f mpc-1.1.0.tar.gz
fi

if [ ! -d 'gmp' ];then
	wget https://mirrors.tuna.tsinghua.edu.cn/gnu/gmp/gmp-6.1.0.tar.xz
	xz -d gmp-6.1.0.tar.xz && tar -xvf gmp-6.1.0.tar && mv gmp-6.1.0 gmp && rm -f gmp-6.1.0.tar
fi

mkdir -p gcc-build 
cd 'gcc-build'

INTSTALL_PATH='/home/hrx/gcc9'

 ../configure --prefix=${INTSTALL_PATH} --enable-shared --enable-threads=posix --enable-checking=yes -with-system-zlib --enable-__cxa_atexit --disable-libunwind-exceptions --enable-gnu-unique-object --enable-linker-build-id --with-linker-hash-style=gnu --enable-languages=c,c++,objc,obj-c++,fortran,lto --enable-plugin --enable-initfini-array --disable-libgcj --without-isl --without-cloog --enable-gnu-indirect-function --build=aarch64-linux-gnu --with-stage1-ldflags=' -Wl,-z,relro,-z,now' --with-boot-ldflags=' -Wl,-z,relro,-z,now' --with-multilib-list=lp64 --disable-werror
 
