#! /bin/bash -e
#git clone https://github.com/gcc-mirror/gcc.git

#apt-get install -y gcc make libncurses5-dev openssl libssl-dev build-essential pkg-config libc6-dev bison flex libelf-dev
HOME=/home/hrx
SOURCE_BASE=https://mirrors.tuna.tsinghua.edu.cn/gnu
cd $HOME

GMP=gmp-4.3.2
MPFR=mpfr-2.4.2

GCC_PATH=$HOME/gcc
cd $GCC_PATH


if [ ! -d "mpfr" ];then
        wget $SOURCE_BASE/mpfr/$MPFR.tar.gz --no-check-certificate
        tar -zxvf $MPFR.tar.gz && mv $MPFR mpfr && rm -f $MPFR.tar.gz
fi

if [ ! -d "mpc" ];then
        wget https://gcc.gnu.org/pub/gcc/infrastructure/mpc-0.8.1.tar.gz --no-check-certificate
        tar -zxvf $MPC.tar.gz && mv $MPC mpc && rm -f $MPC.tar.gz
fi

if [ ! -d "gmp" ];then
        wget $SOURCE_BASE/gmp/$GMP.tar.bz2 --no-check-certificate
        tar -jxvf $GMP.tar.bz2 && mv $GMP gmp && rm -f $GMP.tar.bz2
fi

mkdir gcc-build
cd gcc-build

mkdir install-path
INTSTALL_PATH=$HOME/gcc/install-path

$GCC_PATH/configure --prefix=${INTSTALL_PATH} --enable-languages=c,c++  --libdir=/usr/lib

make -j$(getconf _NPROCESSORS_ONLN)

make install
