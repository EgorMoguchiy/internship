#!/bin/bash
while :
do
        CPU_NOW=($(head -n 1 /proc/stat))
        CPU_USED_PARAM="${CPU_NOW[@]:1:3}"
        CPU_USED_NOW=$((${CPU_USED_PARAM// /+}))
        CPU_TOTAL_PARAM="${CPU_NOW[@]:1:4}"
        CPU_TOTAL_NOW=$((${CPU_TOTAL_PARAM// /+}))

        CPU_USED=$((CPU_USED_NOW - CPU_USED_TEMP))
        CPU_TOTAL=$((CPU_TOTAL_NOW - CPU_TOTAL_TEMP))

        CPU_LOAD=$((100 * CPU_USED / CPU_TOTAL))

        CPU_USED_TEMP=$CPU_USED_NOW
        CPU_TOTAL_TEMP=$CPU_TOTAL_NOW

        echo "CPU load: $CPU_LOAD%"
        echo "<center><h1>CPU load: $CPU_LOAD%</h1></center>" > /var/www/html/cpuLoad.html
        sleep 1
done
