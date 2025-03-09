#!/bin/sh

cat /app/.env.local

composer install

unitd --no-daemon --control unix:/var/run/control.unit.sock &
sleep 1
curl --unix-socket /var/run/control.unit.sock -X PUT -d @/docker-entrypoint.d/config.json http://localhost/config

wait