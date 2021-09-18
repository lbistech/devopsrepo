#!/bin/bash

# This script is for the system level information

# Tell the user that this script is starting ...
echo "Starting the sysinfo script"

# Display the hostname of my system
hostname

# Display the current date and time when this script is executed
date

# Display the kernel release followed by the architecture
uname -r
uname -m

# Display the disk usage in a human readable format
df -h

# Tell the user that this script is ended ...
echo "Stopping the sysinfo script"
