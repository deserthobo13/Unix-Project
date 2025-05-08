#!/bin/bash

# system_metrics.sh
# Displays basic system metrics: CPU, memory, disk, and processes

echo "==============================="
echo "     Diagnostics Dashboard     "
echo "==============================="

# CPU Usage (top -bn1 gives snapshot, grep 'Cpu' extracts CPU line)
echo -e "\n CPU Usage:"
top -bn1 | grep "Cpu(s)" | \
  awk '{printf "User: %.1f%%, System: %.1f%%, Idle: %.1f%%\n", $2, $4, $8}'

# Memory Usage (from free -h)\]
echo -e "\n Memory Usage:"
free -h

# Disk Usage (from df -h)
echo -e "\n Disk Usage:"
df -h | grep -E '^/dev/'  # Only actual disk partitions

# Running Processes (from ps)
echo -e "\n Top 5 Memory-Consuming Processes:"
ps aux --sort=-%mem | awk 'NR<=6{printf "%-10s %-5s %-5s %s\n", $1, $2, $4, $11}'

echo -e "\n Top 5 CPU-Consuming Processes:"
ps aux --sort=-%cpu | awk 'NR<=6{printf "%-10s %-5s %-5s %s\n", $1, $2, $3, $11}'

echo "==============================="
