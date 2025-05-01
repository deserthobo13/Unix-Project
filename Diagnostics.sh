#! /bin/bash

cpu_usage(){
    echo "====CPU Usage===="
    echo "$(top -bn1 | grep "Cpu(s)")"
}

memory_usage(){
    echo "====Memory Usage===="
    echo "$(free -h)"
}

disk_space(){
    echo "====Disk Space===="
    echo "$(df -h)"
}

running_processes(){
    echo "====Running Processes===="
    echo "$(ps aux)"
}

while true; do
    echo "====System Diagnostics===="
    echo "1. CPU Usage"
    echo "2. Memory Usage"
    echo "3. Disk Space"
    echo "4. Running Processes"
    echo "5. Exit"
    read -p "Select an option: " option

    case $option in
        1) cpu_usage ;;
        2) memory_usage ;;
        3) disk_space ;;
        4) running_processes ;;
        5) exit ;;
        *) echo "Invalid option" ;;
    esac
done
