!#/bin/bash
echo "========================================="
echo "      SERVER PERFORMANCE STATISTICS       "
echo "========================================="
echo
echo "###################"
echo "# Total CPU Usage #"
echo "###################"


CPU_IDLE=$(top -bn1 | grep "%Cpu(s):" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/")


CPU_USAGE=$(echo "100 - $CPU_IDLE" | bc)

echo "CPU Usage: $CPU_USAGE %"
echo

echo "######################"
echo "# Total Memory Usage #"
echo "######################"

free | grep "Mem:" -w | awk '{printf "Total: %.1fGi\nUsed: %.1fGi (%.2f%%)\nFree: %.1fGi (%.2f%%)\n",
    $2/1024^2, $3/1024^2, $3/$2*100, $4/1024^2, $4/$2*100}'

echo

echo "####################"
echo "# Total Disk Usage #"
echo "####################"

df -h | grep "/" -w | awk '{printf "Total: %s\nUsed: %s (%s)\nFree: %s (%s)\n", $2, $3, $5, $4, $5}'

echo

echo "################################"
echo "# Top 5 Processes by CPU Usage #"
echo "################################"

ps aux --sort=-%cpu | head -n 6 | awk '{print $1 "\t" $2 "\t" $3 "%\t" $11}'

echo

echo "###################################"
echo "# Top 5 Processes by Memory Usage #"
echo "###################################"

ps aux --sort=-%mem | head -n 6 | awk '{print $1 "\t" $2 "\t" $4 "%\t" $11}'

echo

echo "#################"
echo "# System Uptime #"
echo "#################"
uptime
echo

echo "################"
echo "# OS Version #"
echo "################"
cat /etc/os-release
echo

echo "#################"
echo "# Logged-in Users #"
echo "#################"
who
echo
