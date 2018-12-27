#!/bin/bash
job='cos_ceph'
instance=`hostname`
push_gateway='A.B.C.D:9091'

curl -s http://127.0.0.1:9128/metrics | curl --data-binary @- http://${push_gateway}/metrics/job/${job}/instance/${instance}
