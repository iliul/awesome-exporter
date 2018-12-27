#!/bin/bash

start() {
	echo Start node_exporter
	/root/node_exporter/node_exporter --web.listen-address="127.0.0.1:9100" --log.level="info" > /dev/null 2>&1 &
}

stop() {
	echo Stop node_exporter
	killall node_exporter
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
		echo "Usage: node_exporter (start|stop|restart)"
		;;
esac
