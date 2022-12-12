#!/bin/bash
while :
do
        DATE=$(date +"%H:%M:%S %d-%m-%Y")
        LOG_SIZE=$(stat -c %s /var/log/nginx/nginx.log)

        cat /var/log/nginx/nginx-access.log /var/log/nginx/nginx-error.log > /var/log/nginx/nginx.log
        awk '$9 ~/^4/' /var/log/nginx/nginx.log > /var/log/nginx/nginx-400.log
        awk '$9 ~/^5/' /var/log/nginx/nginx.log > /var/log/nginx/nginx-500.log

        if [ $LOG_SIZE -gt 300 ]
        then
                > /var/log/nginx/nginx.log
                echo "[$DATE] File (/var/log/nginx/nginx.log) has been successfully cleaned" >> /var/log/nginx/nginx-clear.log
        fi
        sleep 5
done