#!/bin/bash

in_dir=huawei_strava_tcx
out_dir=huawei_garmin_tcx

in_tcx=$(ls $in_dir | grep tcx)

for f in $in_tcx; do
    cp $in_dir/$f $out_dir/$f
    # replace 2024-01-19T07:00:54.650000+08:00
    #      to 2024-01-19T07:00:54.600+08:00
    sed -Ei 's/([0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]{1})[0-9]*(\+[0-9]{2}:00)/\100\2/g' $out_dir/$f
    # replace 2023-10-15T07:00:02+08:00
    #      to 2023-10-15T07:00:02.000+08:00
    sed -Ei 's/([0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2})(\+[0-9]{2}:00)/\1\.000\2/g' $out_dir/$f
    sed -i  's/Sport=\"run/Sport=\"Run/g' $out_dir/$f 
    sed -i  's/Sport=\"bik/Sport=\"Bik/g' $out_dir/$f 
done
