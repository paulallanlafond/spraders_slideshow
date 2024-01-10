#!/bin/bash

echo "spraders_slideshow.sh executed at $(date)"

# Find the mount point of the USB drive in /media/
usb_mount_point=$(lsblk -o MOUNTPOINT -nr /dev/sd* | grep '/media/' | head -n 1)
usb_mount_point=$(echo "$usb_mount_point" | xargs)

# Check if a USB drive is found
if [ -n "$usb_mount_point" ]; then
    # Run the slideshow command, pointing to the USB drive
    echo "USB drive found:$usb_mount_point"
    full_command="/usr/bin/screen -S slideshow -dm bash -c '/usr/bin/feh --verbose --info verbosity --recursive --full-screen --auto-zoom --slideshow-delay 20 $usb_mount_point/*.{jpg,jpeg,gif,png}'"
    eval "$full_command"
    read -p "Starting Slideshow..."

else
    echo "No USB drive found in /media/"
    read -p "Plese insert a USB drive and restart the Raspberry Pi"
fi
