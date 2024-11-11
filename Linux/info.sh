#!/bin/bash

# This script displays information about the system on which it is execute

# Tell the user the script is starting
echo "---------------------------"
echo "Starting the sysinfo script"
echo "---------------------------"

# Display the hostname of the system
hostname

# Display the current date and time when this information was collected
date

# Display the kernel release followed by the architecture
uname -r
uname -m

# Display the disk usage in a human readable format
df -h

# End the script by letting the user know that it's done
echo "---------------------------"
echo "Ending the sysinfo script"
echo "---------------------------"
