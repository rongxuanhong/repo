#! /bin/bash -e
#git clone https://github.com/gcc-mirror/gcc.git

sudo apt-get install -y gcc make libncurses5-dev openssl libssl-dev build-essential pkg-config libc6-dev bison flex libelf-dev  texinfo
HOME=/home/hrx
SOURCE_BASE=https://mirrors.huaweicloud.com/gnu
#SOURCE_BASE=https://mirrors.tuna.tsinghua.edu.cn/gnu
cd $HOME

GCC_VERSION=gcc-9.3.0
GMP=gmp-6.1.0
#GMP=gmp-4.3.2
MPC=mpc-1.1.0
#MPFR=mpfr-2.4.2
MPFR=mpfr-4.0.2
if [ ! -d $GCC_VERSION ];then
    wget $SOURCE_BASE/gcc/$GCC_VERSION/$GCC_VERSION.tar.gz && tar -zxvf $GCC_VERSION.tar.gz && rm -f $GCC_VERSION.tar.gz*
fi

GCC_PATH=$HOME/$GCC_VERSION
cd $GCC_PATH


if [ ! -d "mpfr" ];then
        wget $SOURCE_BASE/mpfr/$MPFR.tar.gz
        tar -zxvf $MPFR.tar.gz && mv $MPFR mpfr && rm -f $MPFR.tar.gz
fi

if [ ! -d "mpc" ];then
        wget $SOURCE_BASE/mpc/$MPC.tar.gz
        tar -zxvf $MPC.tar.gz && mv $MPC mpc && rm -f $MPC.tar.gz
fi

if [ ! -d "gmp" ];then
        wget $SOURCE_BASE/gmp/$GMP.tar.bz2
        tar -jxvf $GMP.tar.bz2 && mv $GMP gmp && rm -f $GMP.tar.bz2
fi

mkdir -p gcc-build
cd "gcc-build"

INTSTALL_PATH=$HOME/gcc/build-${GCC_VERSION}
mkdir -p $INTSTALL_PATH

$GCC_PATH/configure --prefix=${INTSTALL_PATH} --enable-checking=yes --disable-nls --disable-libstdcxx-pch --enable-languages=c,c++ --disable-werror --disable-bootstrap --disable-multilib


make -j$(getconf _NPROCESSORS_ONLN)

make install

#echo "export PATH=${INTSTALL_PATH}/bin:\$PATH" >> ~/.bashrc
#source ~/.bashrc
