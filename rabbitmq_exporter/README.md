## 安装

```
# ./setup.sh systemd
```

## 设置环境变量

```
# export RABBIT_USER=video
# export RABBIT_PASSWORD=video123
# export OUTPUT_FORMAT=JSON
# export PUBLISH_PORT=9099
# export RABBIT_URL=http://localhost:15672
```

同时设置到 `~/.bashrc` 中

## 服务自启动

```
# systemctl enable rabbitmq_exporter.service
```

## Grafana Dashboard

See: [https://grafana.com/dashboards/4279](https://grafana.com/dashboards/4279)
