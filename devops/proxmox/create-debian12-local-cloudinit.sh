#!/bin/bash
# Author: Mike Elston (github.com/notsle)
# License: GPL2

apt update -y && apt install nano wget curl libguestfs-tools -y

wget -O debian-12-generic-amd64.qcow2 https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2
virt-customize -a debian-12-generic-amd64.qcow2 --install qemu-guest-agent --install resolvconf --install systemd-resolved --update --run-command 'mkdir -p /etc/network/interfaces.d' --run-command 'echo "auto ens18" >> /etc/network/interfaces.d/ens18' --run-command 'echo "iface ens18 inet manual" >> /etc/network/interfaces.d/ens18'

qm create 100000 --name debian12-cloudinit-template --net0 virtio,bridge=vmbr1 --scsihw virtio-scsi-pci --machine q35 --memory 8192 --cores 4
qm importdisk 100000 debian-12-generic-amd64.qcow2 local -format qcow2

qm set 100000 --scsihw virtio-scsi-pci --scsi0 /var/lib/vz/images/100000/vm-100000-disk-0.qcow2
qm disk resize 100000 scsi0 96G

qm set 100000 --ide2 local:cloudinit
qm set 100000 --agent enabled=1
qm set 100000 --boot c --bootdisk scsi0
qm set 100000 --serial0 socket --vga serial0
qm set 100000 -ipconfig0 ip=dhcp
qm set 100000 --bios ovmf --efidisk0 local:1,format=raw,efitype=4m,pre-enrolled-keys=1
qm template 100000