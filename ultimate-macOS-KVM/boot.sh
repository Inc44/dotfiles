#!/usr/bin/env bash
# shellcheck disable=SC2054

#
#   APC-RUN_01-01-2024_00-00-00
#
#   THIS FILE WAS GENERATED USING AUTOPILOT.
#
#   To boot this script, run the following command:
#   $ ./boot.sh
#

#
#	boot.sh
#	Created by Coopydood as part of the ultimate-macOS-KVM project.
#
#	Profile: https://github.com/Coopydood
#	Repo: https://github.com/Coopydood/ultimate-macOS-KVM
#
#	Adapted from OSX-KVM among others.
#	Greetz to TheNickDude, Dortania, khoalia, foxlet, and other contributors :]
#


ID="macOS"
NAME="macOS 12"
FILE="boot.sh"

ULTMOS=0.12.1
IGNORE_FILE=0
REQUIRES_SUDO=1
VFIO_PTA=0
VFIO_DEVICES=0
GEN_EPOCH=1720521515
FEATURE_LEVEL=7
VERBOSE=1
DISCORD_RPC=1
DISCORD_RPC_IMG="default"

SCREEN_RES="1920x1080"

ALLOCATED_RAM="8G"
CPU_SOCKETS="1"
CPU_CORES="4"
CPU_THREADS="8"
CPU_MODEL="Haswell-noTSX"
CPU_FEATURE_ARGS="+ssse3,+sse4.2,+popcnt,+avx,+aes,+xsave,+xsaveopt,check"

REPO_PATH="/home/pc/ultimate-macOS-KVM"
OVMF_DIR="/home/pc/ultimate-macOS-KVM/ovmf"

VFIO_ID_0="$USR_VFIO_ID_0"
VFIO_ID_1="$USR_VFIO_ID_1"
VFIO_ROM="$USR_VFIO_ROM"

USB_DEVICES="$USR_USB_DEVICES"

NETWORK_DEVICE="vmxnet3"
MAC_ADDRESS="00:16:cb:00:41:37"

OS_ID="Monterey"

HDD_PATH="/dev/disk/by-id/ata-WD_PC_SN810_SDCPNRY-512G-1006_23073G804319"
DISK_TYPE="SSD"

#   You should not have to touch anything below this line, especially if you
#   don't really know what you're doing. It'll probably break something.

args=(
-global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off
-enable-kvm -m "$ALLOCATED_RAM" -cpu "$CPU_MODEL",kvm=on,vendor=GenuineIntel,+invtsc,vmware-cpuid-freq=on,"$CPU_FEATURE_ARGS"
-machine q35
-boot menu=on,splash-time=5
#-device usb-ehci,id=ehci
#-device qemu-xhci,id=xhci
-usb -device usb-kbd -device usb-tablet 
#USB_DEV_BEGIN
-device usb-host,vendorid=0x8087,productid=0x0033
#USB_DEV_END
-smp "$CPU_THREADS",cores="$CPU_CORES",sockets="$CPU_SOCKETS"
-device pcie-root-port,bus=pcie.0,slot=1,x-speed=16,x-width=32
#VFIO_DEV_BEGIN
#VFIO_DEV_END
-device isa-applesmc,osk="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
-drive if=pflash,format=raw,readonly=on,file="$OVMF_DIR/OVMF_CODE.fd"
-drive if=pflash,format=raw,file="$OVMF_DIR/OVMF_VARS.fd"
-smbios type=2
-device ich9-intel-hda -device hda-duplex
-device ich9-ahci,id=sata
-drive id=OpenCore,if=none,format=qcow2,file="$REPO_PATH/boot/OpenCore.qcow2"
-drive id=HDD,if=none,file="$HDD_PATH",format=raw
-device ide-hd,bus=sata.2,drive=OpenCore,bootindex=1
-device ide-hd,bus=sata.3,drive=HDD,rotation_rate=1

############## REMOVE THESE LINES AFTER MACOS INSTALLATION ###############
-drive id=BaseSystem,if=none,file="$REPO_PATH/BaseSystem.img",format=raw
-device ide-hd,bus=sata.4,drive=BaseSystem
##########################################################################

-netdev user,id=net0 -device "$NETWORK_DEVICE",netdev=net0,id=net0,mac="$MAC_ADDRESS"
-device qxl-vga,vgamem_mb=128,vram_size_mb=128    
-monitor stdio
#-display none
#-vga qxl

################ UNCOMMENT IF YOU WANT TO USE VNC MONITOR ################
#-vnc 0.0.0.0:1,password=on -k en-us
##########################################################################

)

while getopts d: flag
do
    case "${flag}" in
        d) DISCORD_RPC=${OPTARG};;
    esac
done

if [ $VERBOSE = 1 ]
then
echo
echo \ \ \──────────────────────────────────────────────
echo \ \ \ \ \ $FILE
echo \ \ \ \ \ $ID $OS_ID
echo
echo \ \ \ \ \ Built with ULTMOS v$ULTMOS
echo \ \ \ \ \ Using $CPU_MODEL CPU model
if [ $REQUIRES_SUDO = 1 ]
then
echo \ \ \ \ \ Superuser privileges enabled
fi
if [ $VFIO_PTA = 1 ]
then
echo \ \ \ \ \ Passthrough enabled
else
echo \ \ \ \ \ Passthrough disabled
fi
if [ $DISCORD_RPC = 1 ]
then
echo \ \ \ \ \ Discord RPC enabled
else
echo \ \ \ \ \ Discord RPC disabled
fi
echo \ \ \──────────────────────────────────────────────
echo
fi

if [ $DISCORD_RPC = 1 ]
then
"$REPO_PATH/scripts/drpc.py" --os "$OS_ID" --pt $VFIO_DEVICES --wd "$REPO_PATH" --show "$DISCORD_RPC_IMG" &
fi

qemu-system-x86_64 "${args[@]}"

if [ $DISCORD_RPC = 1 ]
then
pkill -f drpc.py
fi
