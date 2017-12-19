#!/bin/bash

cp `pwd`/../kibana/plugins/logtrail/logtrail.json /usr/share/kibana/plugins/logtrail
cp `pwd`/../logstash/conf.d/sardana.conf /etc/logstash/conf.d