FROM debian:13

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates patch git \
	make binutils gcc file wget cpio unzip rsync bc bzip2 && \
	rm -rf /var/lib/apt/lists/* && \
	apt-get clean

ARG BRANCH="master"
RUN git clone --recurse-submodules --single-branch --depth 1 -b ${BRANCH} \
	https://github.com/Mr-Bossman/zalrsc-buildroot

WORKDIR zalrsc-buildroot

ARG THREADS=1
RUN make -C buildroot BR2_EXTERNAL=$PWD/ qemu_riscv32_virt_zalrsc_defconfig && \
	make -C buildroot -j${THREADS}

