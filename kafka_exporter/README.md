## 安装

```
# ./setup.sh systemd
```

## 设置环境变量

```
# echo "kafka 127.0.0.1" >> /etc/hosts
```

## 服务自启动

```
# systemctl enable kafka_exporter.service
```

## Grafana Dashboard

See: [https://grafana.com/dashboards/7589](https://grafana.com/dashboards/7589)
