version=\
(
    '2.0.4'
)

url=\
(
    "http://downloads.sourceforge.net/iperf/iperf-$version.tar.gz"
)

md5=\
(
    '8c5bc14cc2ea55f18f22afe3c23e3dcb'
)

maintainer=\
(
    'Ricardo Martins <rasm@fe.up.pt>'
)

configure()
{
    export ac_cv_func_malloc_0_nonnull='yes'
    "../iperf-$version/configure" \
        --target="$cfg_target_canonical" \
        --host="$cfg_target_canonical" \
        --build="$cfg_host_canonical" \
        --prefix="$cfg_dir_rootfs/usr"
}

build()
{
    $cmd_make
}

target_install()
{
    $cmd_target_strip src/iperf -o $cfg_dir_rootfs/usr/bin/iperf
}
