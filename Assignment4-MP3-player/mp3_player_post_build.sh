#!/bin/sh

echo 'PS1="rapi_shell>"' >> ${TARGET_DIR}/etc/profile

export PATH=/home/marcelle/build_root/buildroot-2019.11.1/output/host/bin:$PATH
aarch64-linux-gcc ${TARGET_DIR}/myApplications/myapp.c -o ${TARGET_DIR}/myApplications/printHello.o

