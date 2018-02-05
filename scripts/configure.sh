#!/bin/sh

nml=`cat /rundir/namelist.txt`

# configure
$camcfg/build-namelist -namelist "$nml" -config /bld/config_cache.xml

echo "Editing start time/date"
sed -i.bak 's/\ *start_ymd.*/start_ymd = 990412/' drv_in
sed -i.bak 's/\ *start_tod.*/start_tod = 0/' drv_in
sed -i.bak 's/\ *stop_n.*/stop_n = 20/' drv_in

echo "Running CAM"
/bld/cam | tee run_output | grep DATE 

