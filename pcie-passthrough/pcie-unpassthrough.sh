#!/bin/sh

DEVS="0000:04:00.0"

if [ ! -z "$(ls -A /sys/class/iommu)" ]; then
    for DEV in $DEVS; do
        echo "$DEV" > /sys/bus/pci/drivers/vfio-pci/unbind
        echo "nvme" > /sys/bus/pci/devices/$DEV/driver_override
        echo "$DEV" > /sys/bus/pci/drivers/nvme/bind
    done
fi

rmmod vfio-pci
