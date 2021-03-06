version=\
(
    '1.07'
)

url=\
(
    "ftp://lx10.tx.ncsu.edu/pub/Linux/drivers/USB/MCCLIBUSB.$version.tgz"
)

md5=\
(
    '1c5d6aed5fe6381b8060990f07929933'
)

maintainer=\
(
    'Ricardo Martins <rasm@oceanscan-mst.com>'
)

requires=\
(
    'libusb/default'
    'hidapi/default'
)

build()
{
    $cmd_make CC="$cmd_target_cc" -C ../mcc-libusb
}

host_install()
{
    cd "../mcc-libusb" &&

    $cmd_mkdir \
        "$cfg_dir_toolchain_sysroot/usr/lib" \
        "$cfg_dir_toolchain_sysroot/usr/include/mccusb" &&
    $cmd_cp \
        libmccusb.so libmccusb.a \
        "$cfg_dir_toolchain_sysroot/usr/lib" &&
    $cmd_cp \
        pmd.h usb-1608G.h \
        "$cfg_dir_toolchain_sysroot/usr/include/mccusb"
}

target_install()
{
    cd "../mcc-libusb" &&

    $cmd_cp \
        "$cfg_dir_toolchain_sysroot/usr/lib/libmccusb"*.so* \
        "$cfg_dir_rootfs/lib" &&

    $cmd_target_strip "$cfg_dir_rootfs/lib/libmccusb"*.so*
}
