# Zalrsc Buildroot
## Test distro for testing the Zalrsc extention

### How to build RISC-V 64:

```bash
git clone https://github.com/Mr-Bossman/zalrsc-buildroot

cd zalrsc-buildroot

git submodule update --init

make -C buildroot BR2_EXTERNAL=$PWD/ qemu_riscv64_virt_zalrsc_defconfig

make -C buildroot

# Generate dtb with a extention
buildroot/output/host/bin/qemu-system-riscv64 -M virt,dumpdtb=isa_with_amo.dtb -cpu rv64,a=on,zawrs=off,zalrsc=on

buildroot/output/host/bin/qemu-system-riscv64 -M virt -bios buildroot/output/images/fw_jump.bin -kernel buildroot/output/images/Image -append "rootwait root=/dev/vda ro" -drive file=buildroot/output/images/rootfs.ext2,format=raw -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic -cpu rv64,a=off,zawrs=off,zalrsc=on,mvendorid=0x127,marchid=0x8000000000000201 -dtb isa_with_amo.dtb
```
