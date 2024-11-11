#!/bin/bash

echo "--- These are the system level commands ---"

#Tell the user that the script is starting
echo "---Starting the system information script ---"

# Display the hostname of the system
echo "--- My System hostname is ---"
hostname

# Display the current date and time of the system
echo "--- The current date and time is ---"
date

# Display the kernel release followed by the architecture
echo "--- Kernel level information ---"
uname -r
uname -m 

# Display the dish usages
df -h

# End the script 
echo "Stopping the system information script"