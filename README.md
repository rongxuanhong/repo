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

# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-proposed main restricted universe multiverse
