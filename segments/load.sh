#!/usr/bin/env sh
# Print the average load.
uptime | cut -d "," -f 3- | cut -d ":" -f2 | tr "," " "

exit 0
