#!/bin/sh

echo Running initial Clamav def update
cvd update

# Generate a random sleep time so we don't all hit the same servers at the same time.
if [ ! -f /sleeptime ]; then
    echo "Setting Random Sleep"
    shuf -i 300-3300 -n 1 >/sleeptime
    fi
echo "Random sleep is: `cat /sleeptime`s"

echo Staring Crond
crond -l 2 -f &

#echo Nginx Config
#cat /etc/nginx/nginx.conf

echo Starting Nginx
exec nginx
