#!/bin/bash

install_service_systemv() {
    echo Install Service
    cp node_exporter.sh /etc/init.d/node_exporter
    chmod 755 /etc/init.d/node_exporter
    service node_exporter start
}

install_service_systemd() {
    echo Install Service
    cp node_exporter.service /etc/systemd/system/
    systemctl daemon-reload
    systemctl start node_exporter.service
}

install_cron() {
    if crontab -l | grep "push.sh >"; then
        echo Already installed
    else
        echo Install cron job
        temp_file=crontab-push
        crontab -l > ${temp_file}
        echo "* * * * * /root/node_exporter/push.sh > /dev/null 2>&1" >> ${temp_file}
        crontab $temp_file
        rm $temp_file
    fi
}

case $1 in
    initv)
        install_service_systemv
        ;;
    systemd)
        install_service_systemd
        ;;
    *)
        install_service_systemv
        ;;
esac
install_cron
