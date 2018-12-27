#!/bin/bash

start() {
	echo Start rabbitmq_exporter
        RABBIT_USER=video RABBIT_PASSWORD=video123 OUTPUT_FORMAT=JSON PUBLISH_PORT=9099 RABBIT_URL=http://localhost:15672 /root/rabbitmq_exporter/rabbitmq_exporter > /dev/null 2>&1 &
}

stop() {
	echo Stop rabbitmq_exporter
	killall rabbitmq_exporter
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
		echo "Usage: rabbitmq_exporter (start|stop|restart)"
		;;
esac
