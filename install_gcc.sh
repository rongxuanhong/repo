#! /bin/bash
#git clone https://github.com/gcc-mirror/gcc.git

apt-get install -y gcc make libncurses5-dev openssl libssl-dev build-essential pkg-config libc6-dev bison flex libelf-dev

cd $HOME
GCC_VERSION=gcc-4.9.0
#if [ ! -d $GCC_VERSION.tar.gz ];then
#    wget https://mirrors.tuna.tsinghua.edu.cn/gnu/gcc/$GCC_VERSION/$GCC_VERSION.tar.gz && tar -zxvf $GCC_VERSION.tar.gz
#fi
tar -zxvf '$GCC_VERSION.tar.gz'
GCC_PATH='$HOME/$GCC_VERSION'
cd $GCC_PATH

GMP=gmp-4.3.2
MPC=mpc-1.0.1
MPFR=mpfr-2.4.2

if [ ! -d 'mpfr' ];then
	wget https://mirrors.tuna.tsinghua.edu.cn/gnu/mpfr/$MPFR.tar.gz
	tar -zxvf $MPFR.tar.gz && mv $MPFR mpfr && rm -f $MPFR.tar.gz
fi

if [ ! -d 'mpc' ];then
	wget https://mirrors.tuna.tsinghua.edu.cn/gnu/mpc/$MPC.tar.gz
	tar -zxvf $MPC.tar.gz && mv $MPC mpc && rm -f $MPC.tar.gz
fi

if [ ! -d 'gmp' ];then
	wget https://mirrors.tuna.tsinghua.edu.cn/gnu/gmp/$GMP.tar.bz2
	tar -jxvf $GMP.tar.bz2 && mv $GMP gmp && rm -f $GMP.tar
fi

mkdir -p gcc-build 
cd 'gcc-build'

INTSTALL_PATH='$GCC_PATH/gcc-build/gcc'
mkdir -p $INSTALL_PATH

../configure --prefix=${INTSTALL_PATH} --enable-checking=yes -with-system-zlib --enable-shared  --enable-languages=c,c++,objc,obj-c++,fortran,lto --disable-werror --disable-bootstrap --disable-multilib

make -j$(getconf _NPROCESSORS_ONLN)

make install -j$(getconf _NPROCESSORS_ONLN)

echo "export PATH=${INTSTALL_PATH}/bin:$PATH" >> ~/.bashrc
source ~/.bashrc
