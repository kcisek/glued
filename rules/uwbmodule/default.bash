version=\
(
    '1.7'
)
url=\
(
    "https://dl.dropboxusercontent.com/u/13288253/uwbmodule-$version.tar.gz"
)

md5=\
(
    'dc151d3b05777d070a681cbf85c2102b'
)

if [ -d "$cfg_dir_builds/linux/linux-"* ]; then
    kernel="$(echo $cfg_dir_builds/linux/linux-*)"
   
fi

build()
{  
    echo "CONFIG_UWB_MODULE: $CONFIG_UWB_MODULE"
    $cmd_make \
        ARCH=$cfg_target_linux \
        CROSS_COMPILE=/home/kcisek/workspace/kcisek/glued/lctr-b2xx/toolchain/bin/$cfg_target_canonical- \
        -C "$kernel" \
        M=`pwd` \
        src=`pwd`\
        modules
        

    echo "cfg_target_linux: $cfg_target_linux"
    echo "cfg_target_canonical-: $cfg_target_canonical-"
    echo "kernel: $kernel"
    echo "M=`pwd`"
}

target_install()
{
    $cmd_make \
        ARCH=$cfg_target_linux \
        CROSS_COMPILE=$cfg_target_canonical- \
        M=`pwd` \
        INSTALL_MOD_PATH=$cfg_dir_rootfs \
        -C "$kernel" \
        modules_install

    echo "cfg_target_linux: $cfg_target_linux"
    echo "cfg_target_canonical-: $cfg_target_canonical-"
    echo "kernel: $kernel"
    echo "cfg_dir_rootfs: $cfg_dir_rootfs"
}