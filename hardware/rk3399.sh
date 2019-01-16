#!/bin/bash
# Version 1.0

# Get superuser privileges
if [ $EUID != 0 ]; then
    echo "This script requires superuser privileges:"
    sudo "$0" "$@"
    exit $?
fi

echo "CPU-A53 - set to 1200 MHz"
sudo echo "performance" > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
sudo echo 1200000 > /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
echo "CPU-A72 - set to 1200 MHz"
sudo echo "performance" > /sys/devices/system/cpu/cpufreq/policy4/scaling_governor
sudo echo 1200000 > /sys/devices/system/cpu/cpufreq/policy4/scaling_max_freq
echo "GPU-Mali - set to 600 MHz"
sudo echo "performance" > /sys/class/misc/mali0/device/devfreq/ff9a0000.gpu/governor
sudo echo 600000000 > /sys/class/misc/mali0/device/devfreq/ff9a0000.gpu/max_freq
echo "done"
