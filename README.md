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
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCne8eJtPUobOoJk4mLbPTYADVS/nT6sIYNjS9pfIO1kfk/M/dUWXNwS2Y0REXi/n6rThQ+r7G2x0w
wPy0qFICVnBZ+4KT+QpMp3zO/o7hORCm/seq2wz1WBAJeAJmBaYJKdENrsyDr31vSi/rG6+cvfsuPYqC9pgtjkYE4ziOdtRt3tFuIxqaup50hFQLi/J
T/tDS6wJOs7hMwNSLhPg4epaHe/wF9+DIJ5XfCKK5ToKQXvwOKRd0f8jfFl9P7edEu22lXZpMOVd3CNB5xuN92RfKsRyDXQ8LfsilwhzM1cg5M7Fx9X
QlCdPYp+nE6+DgvySA4X3Yamf/Ug125Zy3v root@client1







# Create ${2} .S file with all symbols from the ${1} object file
kallsyms()
{
        local kallsymopt;

        if [ -n "${CONFIG_KALLSYMS_ALL}" ]; then
                kallsymopt="${kallsymopt} --all-symbols"
        fi

        if [ -n "${CONFIG_KALLSYMS_ABSOLUTE_PERCPU}" ]; then
                kallsymopt="${kallsymopt} --absolute-percpu"
        fi

        if [ -n "${CONFIG_KALLSYMS_BASE_RELATIVE}" ]; then
                kallsymopt="${kallsymopt} --base-relative"
        fi
        kallsymopt="${kallsymopt} $3 $4 $5"


        info KSYMS ${2}
        #${NM} -n ${1} | scripts/kallsyms ${kallsymopt} > ${2}
        #hrxadd
        (
        if [ -n "$CONFIG_LTO" -a -n "$CONFIG_KALLSYMS_SINGLE" -a -n "$CONFIG_CC_IS_GCC" ] &&
                ( ${OBJDUMP} -h ${1} | grep -q gnu\.lto) ; then
        # workaround for slim LTO gcc-nm not outputing static symbols
        # http://gcc.gnu.org/PR60016
        # generate a fake symbol table based on the LTO function sections.
        # This unfortunately "knows" about the internal LTO file format
        # and only works for functions

        # read the function names directly from the LTO object
        objdump -h ${1} |
                awk '/gnu\.lto_[a-z]/ { gsub(/\.gnu\.lto_/,""); gsub(/\..*/, ""); print "0 t " $2 } '
        # read the non LTO symbols with readelf (which doesn't use the LTO plugin,
        # so we only get pure ELF symbols)
        # readelf doesn't handle ar, so we have to expand the objects
        echo ${1} | sed 's/ /\n/g' | grep built-in.a | while read i ; do
                ${AR} t $i | while read j ; do readelf -s $j ; done
        done | awk 'NF >= 8 { print "0 t " $8 } '
        # now handle the objects
        echo ${1} | sed 's/ /\n/g' | grep '\.o$' | while read i ; do
                readelf -s $i
        done | awk 'NF >= 8 {
        if ($8 !~ /Name|__gnu_lto_slim|\.c(\.[0-9a-f]+)?/) { print "0 t " $8 }
        }'
        else
                ${NM} -n ${1}
        fi
        ) | scripts/kallsyms ${kallsymopt} > ${2}
        # hrxadd,239 line in this for andi code,but openeuler not in here？？
}
# Perform one step in kallsyms generation, including temporary linking of
# vmlinux.
kallsyms_step()
{
        kallsymso_prev=${kallsymso}
        kallsyms_vmlinux=.tmp_vmlinux.kallsyms${1}
        kallsymso=${kallsyms_vmlinux}.o
        kallsyms_S=${kallsyms_vmlinux}.S

        vmlinux_link ${kallsyms_vmlinux} "${kallsymso_prev}" ${btf_vmlinux_bin_o}
        kallsyms ${kallsyms_vmlinux} ${kallsyms_S}

        info AS ${kallsyms_S}
        ${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
              ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} \
              -c -o ${kallsymso} ${kallsyms_S}
}


