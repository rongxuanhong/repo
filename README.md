1. GCC 9.3.0
https://mirrors.tuna.tsinghua.edu.cn/gnu/gcc/gcc-9.3.0/gcc-9.3.0.tar.xz
2. GCC 6.1.0
https://mirrors.tuna.tsinghua.edu.cn/gnu/gcc/gcc-6.1.0/gcc-6.1.0.tar.gz
hrx_help(){
    cur_dir='/home/hrx'
    repo_fir='/home/hrx/repo'
    if [ "pull" = $1 ];then
        cd $repo_dir && git pull
    fi
    cat $repo_dir/README.md && cd $cur_dir
}

sudo apt-add-repository -yu 'deb http://ppa.launchpad.net/ubuntu-toolchain-r/test/ubuntu xenial main'
sudo apt update
sudo apt-get install gcc-4.9 g++-4.9 gcc-4.9-multilib

https://github.com/andikleen/linux-misc/archive/lto-3.8.zip

./source/scripts/config --disable function_tracer --disable function_graph_tracer --disable stack_tracer --enable lto_menu --disable lto_disable --disable lto_debug --disable lto_slim
https://mirrors.tuna.tsinghua.edu.cn/gnu/binutils/binutils-2.27.tar.gz

https://mirrors.edge.kernel.org/pub/linux/devel/binutils/binutils-2.23.51.0.9.tar.gz

wget http://ftp.gnu.org/gnu/texinfo/texinfo-4.13a.tar.gz
tar -zxvf texinfo-4.13a.tar.gz
cd texinfo-4.13
./configure
make
sudo make install

https://mirrors.tuna.tsinghua.edu.cn/gnu/make/make-3.81.tar.gz

./scripts/config --disable function_tracer --disable function_graph_tracer \
			--disable stack_tracer --enable lto_menu --disable lto_disable \
			--disable gcov --disable kallsyms_all --disable modversions

https://developer.arm.com/-/media/Files/downloads/gnu-a/10.2-2020.11/binrel/gcc-arm-10.2-2020.11-aarch64-aarch64-none-elf.tar.xz?revision=9611f84a-41b8-4eae-9c30-045c830f5337&la=en&hash=109566BAD01B49B8BED6E60956DAB59ADFABAE62


apt-get update
apt-get install software-properties-common apt-transport-https
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xB4112585D386EB94

add-apt-repository https://dl.hhvm.com/ubuntu
apt-get update
apt-get install hhvm

./configure -DCMAKE_INSTALL_PREFIX=$HHVM_DIR -DCMAKE_BUILD_TYPE=RelWithDebInfo

cd ~/Download
wget https://cmake.org/files/v3.13/cmake-3.13.0-Linux-x86_64.tar.gz
tar -xzvf cmake-3.13.0-Linux-x86_64.tar.gz

# 解压出来的包，将其放在 /opt 目录下，其他目录也可以，主要别以后不小心删了
sudo mv cmake-3.13.0-Linux-x86_64 /opt/cmake-3.13.0

# 建立软链接
sudo ln -sf /opt/cmake-3.13.0/bin/*  /usr/bin/

# 查看 cmake 版本
cmake --version

wget https://github.com/redis/redis/archive/4.0.zip

sudo echo 'vm.overcommit_memory = 1' >> /etc/sysctl.conf
sudo sysctl -p
