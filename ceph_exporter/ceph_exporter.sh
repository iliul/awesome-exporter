#!/bin/bash

start() {
	echo Start ceph_exporter
	/root/ceph_exporter/ceph_exporter --telemetry.addr="127.0.0.1:9128" > /dev/null 2>&1 &
}

stop() {
	echo Stop ceph_exporter
	killall ceph_exporter
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
		echo "Usage: ceph_exporter (start|stop|restart)"
		;;
esac
