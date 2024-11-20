#!/bin/bash

json_file="raw_datas/HUAWEI_HEALTH_20241111095826/Motion path detail data & description/motion path detail data.json"
output="raw_datas/HUAWEI_HEALTH_20241111095826/huawei_strava_tcx"

python Hitrava.py --json "$json_file" --output_dir "$OUTPUT"
