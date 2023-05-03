#!/bin/sh

DEVS="0000:04:00.0"

modprobe -i vfio-pci

if [ ! -z "$(ls -A /sys/class/iommu)" ]; then
    for DEV in $DEVS; do
        echo "$DEV" > /sys/bus/pci/drivers/nvme/unbind
        echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
        echo "$DEV" > /sys/bus/pci/drivers/vfio-pci/bind
    done
fi
