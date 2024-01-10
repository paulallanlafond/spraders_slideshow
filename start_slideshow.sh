#!/bin/bash

set -x

echo "spraders_slideshow.sh executed at $(date)" >> /home/spraders/Documents/GitHub/spraders_slideshow/slideshow_log.txt
# exec > /home/spraders/Documents/GitHub/spraders_slideshow/slideshow_stdout.txt 2>&1
env | sort

sleep 10

# /usr/bin/screen -S slideshow -dm bash -c '/usr/bin/feh --quiet --recursive --randomize --full-screen --slideshow-delay 5 /media/spraders/SPRADERS/*.{jpg,jpeg,gif,png}'
# /usr/bin/screen -S slideshow -dm bash -c '/usr/bin/feh --recursive --randomize --full-screen --slideshow-delay 5 /home/spraders/Desktop/New/*.{jpg,jpeg,gif,png}'
# /usr/bin/screen -S slideshow -dm bash -c '/usr/bin/feh --verbose --info verbosity --recursive --randomize --full-screen --slideshow-delay 10 /home/spraders/Desktop/New/*.{jpg,jpeg,gif,png}'
# /usr/bin/screen -S slideshow -dm bash -c '/usr/bin/feh --verbose --info verbosity --recursive --randomize --full-screen --slideshow-delay 10 /media/spraders/SPRADERS/*.{jpg,jpeg,gif,png}'
# /usr/bin/screen -S slideshow -dm bash -c '/usr/bin/feh --verbose --info verbosity --recursive --full-screen --slideshow-delay 20 /media/spraders/SPRADERS/*.{jpg,jpeg,gif,png}'

# Find the mount point of the USB drive in /media/
cd /home/spraders/Documents/GitHub/spraders_slideshow

usb_mount_point=$(lsblk -o MOUNTPOINT -nr /dev/sd* | grep '/media/' | head -n 1)
usb_mount_point=$(echo "$usb_mount_point" | xargs)

# Check if a USB drive is found
if [ -n "$usb_mount_point" ]; then
    echo "    USB drive found:$usb_mount_point" >> /home/spraders/Documents/GitHub/spraders_slideshow/slideshow_log.txt
    # Run the slideshow command, pointing to the USB drive
    # /usr/bin/screen -S slideshow -dm bash -c '/usr/bin/feh --verbose --info verbosity --recursive --full-screen --slideshow-delay 20 $usb_mount_point/*.{jpg,jpeg,gif,png}'

    full_command="/usr/bin/screen -S slideshow -dm bash -c '/usr/bin/feh --verbose --info verbosity --recursive --full-screen --slideshow-delay 20 $usb_mount_point/*.{jpg,jpeg,gif,png}'"
    echo "    Command: $full_command" >> /home/spraders/Documents/GitHub/spraders_slideshow/slideshow_log.txt
    # eval "$full_command"can you 
    # sleep 10
    # eval "$full_command" > /home/spraders/Documents/GitHub/spraders_slideshow/full_command_log.txt 2>&1
    eval "$full_command"
    echo "    -----------------------------------------" >> /home/spraders/Documents/GitHub/spraders_slideshow/slideshow_log.txt

else
    echo "    No USB drive found in /media/" >> /home/spraders/Documents/GitHub/spraders_slideshow/slideshow_log.txt
fi

    echo "    Exiting" >> /home/spraders/Documents/GitHub/spraders_slideshow/slideshow_log.txt

set +x

read -p "Press Enter to Exit"
