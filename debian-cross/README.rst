Cross builder container
-----------------------

A container to cross-compile and test projects for armv7, aarch64 or riscv64 targets.

::

    podman build -t tprrt/debian-cross:latest -f ./Dockerfile .

    # Launch the container
    cd <src>
    podman run --rm -i -t --security-opt seccomp=unconfined --security-opt label=disable --userns=keep-id --mount type=bind,source=$(pwd),target=/src --workdir /src tprrt/debian-cross

    # Stop the container
    podman container stop -t=1 tprrt/debian-cross
    podman container rm tprrt/debian-cross


Following, an example of use to cross-compile Busybox and test it with Qemu:

::

    export ARCH=aarch64
    export CROSS_COMPILE=aarch64-linux-
    export export PATH=/aarch64--glibc--stable-2020.08-1/bin:$PATH

    export LDFLAGS="--static"

    make defconfig
    make -j$(nproc)

    qemu-aarch64-static busybox <applet>


Following, an example of use to cross-compile U-boot and test it with Qemu:

::

    export ARCH=aarch64
    export CROSS_COMPILE=aarch64-linux-
    export export PATH=/aarch64--glibc--stable-2020.08-1/bin:$PATH

    make qemu_arm64_defconfig
    make -j$(nproc)
    # make tools-only

    qemu-system-aarch64 -nographic -no-reboot -machine virt -cpu cortex-a57 -smp 2 -m 256 -bios u-boot.bin

Following, an example of use to cross-compile the kernel Linux and test it with Qemu:

::

    export ARCH=arm64
    export CROSS_COMPILE=aarch64-linux-
    export export PATH=/aarch64--glibc--stable-2020.08-1/bin:$PATH

    make defconfig
    make -j$(nproc)

    qemu-system-aarch64 -nographic -no-reboot -machine virt -cpu cortex-a57 -smp 2 -m 256 -kernel arch/arm64/boot/Image [-initrd /src/busybox/rootfs.img.gz] -append "panic=5 ro ip=dhcp root=/dev/ram [rdinit=/sbin/init]"[-bios u-boot.bin]
    qemu-system-aarch64 -nographic -no-reboot -machine virt -cpu cortex-a57 -smp 2 -m 256 -kernel arch/arm64/boot/Image -initrd /src/busybox/rootfs.img.gz -append "panic=5 ro ip=dhcp root=/dev/ram rdinit=/sbin/init"

    qemu-system-aarch64 -nographic -no-reboot -machine virt -cpu cortex-a57 -smp 2 -m 256 -kernel arch/arm64/boot/Image -append "panic=5 ro ip=dhcp root=/dev/vda" [-drive file=/src/busybox/rootfs.img,format=raw,if=none,id=hd0 -device virtio-blk-device,drive=hd0][-bios u-boot.bin]
    qemu-system-aarch64 -nographic -no-reboot -machine virt -cpu cortex-a57 -smp 2 -m 256 -kernel arch/arm64/boot/Image -append "panic=5 ro ip=dhcp root=/dev/vda" -drive file=/src/busybox/rootfs.img,format=raw,if=none,id=hd0 -device virtio-blk-device,drive=hd0

    


Following, the value of the environment variables to use the avaible toolchains:

::

    # To use the ARMv7 toolchain
    export ARCH=armv7-eabi
    export CROSS_COMPILE=arm-linux-
    export export PATH=/armv7-eabihf--glibc--stable-2020.08-1/bin:$PATH

    # To use the ARMv8 toolchain
    export ARCH=aarch64
    export CROSS_COMPILE=aarch64-linux-
    export export PATH=/aarch64--glibc--stable-2020.08-1/bin:$PATH

    # To use the RISC-V toochain
    export ARCH=riscv64
    export CROSS_COMPILE=riscv64-linux-
    export export PATH=/riscv64--glibc--bleeding-edge-2020.08-1/bin:$PATH