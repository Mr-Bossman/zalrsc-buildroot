# Zalrsc Buildroot
## Test distro for testing the Zalrsc extention

### How to build RISC-V 64:

```bash
git clone https://github.com/Mr-Bossman/zalrsc-buildroot

cd zalrsc-buildroot

git submodule update --init

make -C buildroot BR2_EXTERNAL=$PWD/ qemu_riscv64_virt_zalrsc_defconfig

make -C buildroot

buildroot/output/host/bin/qemu-system-riscv64 -M virt -bios buildroot/output/images/fw_jump.bin -kernel buildroot/output/images/Image -append "rootwait root=/dev/vda ro" -drive file=buildroot/output/images/rootfs.ext2,format=raw -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic -cpu rv64,a=off,zawrs=off,zalrsc=on
```

### How to build RISC-V 32:

```bash
git clone https://github.com/Mr-Bossman/zalrsc-buildroot

cd zalrsc-buildroot

git submodule update --init

make -C buildroot BR2_EXTERNAL=$PWD/ qemu_riscv32_virt_zalrsc_defconfig

make -C buildroot

buildroot/output/host/bin/qemu-system-riscv32 -M virt -bios buildroot/output/images/fw_jump.bin -kernel buildroot/output/images/Image -append "rootwait root=/dev/vda ro" -drive file=buildroot/output/images/rootfs.ext2,format=raw -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic -cpu rv32,a=off,zawrs=off,zalrsc=on
```
