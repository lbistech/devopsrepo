#!/bin/bash
#

echo "-------------------------"
echo "--- System Admin CMDs ---"
echo "-------------------------"

# Here you have the basic linux commads
echo "Current date and time is $(date)"
echo "The Server Uptime is $(uptime -p)"
echo "The Current login user is $(whoami)"

# Here you have system administrator commands
echo "Your System hostname is $(hostname)"
echo "Your System OS information is $(uname -a)"
echo "Your System Current Storage Details are $(df -h)"
echo "Your System Current Memory Details are $(free -m)"
