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
