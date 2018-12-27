#!/bin/bash

install_service_systemv() {
    echo Install Service
    cp nginx_exporter.sh /etc/init.d/nginx_exporter
    chmod 755 /etc/init.d/nginx_exporter
    service nginx_exporter start
}

install_service_systemd() {
    echo Install Service
    cp nginx_exporter.service /etc/systemd/system/
    systemctl daemon-reload
    systemctl start nginx_exporter.service
}

install_cron() {
    if crontab -l | grep "push_nginx.sh >"; then
        echo Already installed
    else
        echo Install cron job
        temp_file=crontab-push
        crontab -l > ${temp_file}
        echo "* * * * * /root/node_exporter/push_nginx.sh > /dev/null 2>&1" >> ${temp_file}
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
