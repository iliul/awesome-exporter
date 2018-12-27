#!/bin/bash
job='rabbitmq_node'
instance=`hostname`
push_gateway='106.2.3.100:9091'

curl -s http://127.0.0.1:9099/metrics | curl --data-binary @- http://${push_gateway}/metrics/job/${job}/instance/${instance}
