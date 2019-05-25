#!/bin/bash -x
#
# Set list of days to repost
# Set overall dates
# uncomment "for" through "done" lines to repost several days
#
#for x in {26..31}  ; do
#/usr/local/bin/smatool --config /usr/local/etc/smatool.conf --daylight --datefrom "2018-05-$x 06:00:00" --dateto "2018-05-$x 21:00:00" 
#sleep 3600
#done
#for x in {1..7}  ; do
#/usr/local/bin/smatool --config /usr/local/etc/smatool.conf --daylight --datefrom "2018-06-$x 06:00:00" --dateto "2018-06-$x 21:00:00" 
#done
#
# Modify this line to do one time period
#
/usr/local/bin/smatool --config /usr/local/etc/smatool.conf --daylight --datefrom "2018-06-07 06:00:00" --dateto "2018-06-08 21:00:00" -repost

