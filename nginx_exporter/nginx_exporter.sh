#!/bin/bash

start() {
	echo Start nginx_exporter
	/root/node_exporter/nginx_exporter --web.listen-address="127.0.0.1:9113" > /dev/null 2>&1 &
}

stop() {
	echo Stop nginx_exporter
	killall nginx_exporter
}

case $1 in
	start)
		start
		;;
	stop)
		stop
		;;
	restart)
		stop
		start
		;;
	*)
		echo "Usage: nginx_exporter (start|stop|restart)"
		;;
esac
