#!/bin/bash

echo "Waiting for devices to become ready..."
sleep 10

cd /home/spraders/Documents/GitHub/spraders_slideshow
echo "Getting latest code from GitHub..."
git pull

cd /home/spraders/Desktop
source /home/spraders/Documents/GitHub/spraders_slideshow/start_slideshow.sh
