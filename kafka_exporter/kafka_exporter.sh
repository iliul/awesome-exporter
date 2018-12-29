#!/bin/bash

start() {
	echo Start kafka_exporter
    /root/kafka_exporter/kafka_exporter --kafka.server=kafka:9092
}

stop() {
	echo Stop kafka_exporter
	killall kafka_exporter
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
		echo "Usage: kafka_exporter (start|stop|restart)"
		;;
esac
