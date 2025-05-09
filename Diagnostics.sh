#!/bin/bash


# Displays basic system diagnostics: CPU, memory, disk, and processes
# Made by Holland Carter

echo "==============================================="
echo "              System Diagnostics               "
echo "==============================================="

echo -e "\n CPU Usage:"
top -bn1 | grep "Cpu(s)" | 
  awk '{printf "User: %.1f%%, System: %.1f%%, Idle: %.1f%%\n", $2, $4, $8}'

echo -e "\n Memory Usage:"
free -h

echo -e "\n Disk Usage:"
df -h | grep -E '^/dev/'

echo -e "\n Top 5 Memory-Consuming Processes:"
ps aux --sort=-%mem | awk 'NR<=6{printf "%-10s %-5s %-5s %s\n", $1, $2, $4, $11}'

echo -e "\n Top 5 CPU-Consuming Processes:"
ps aux --sort=-%cpu | awk 'NR<=6{printf "%-10s %-5s %-5s %s\n", $1, $2, $3, $11}'

echo "==========================================================================="
