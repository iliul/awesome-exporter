#!/bin/bash
job='spc_nginx'
instance=`hostname`
push_gateway='A.B.C.D:9091'

curl -s http://127.0.0.1:9113/metrics | curl --data-binary @- http://${push_gateway}/metrics/job/${job}/instance/${instance}
