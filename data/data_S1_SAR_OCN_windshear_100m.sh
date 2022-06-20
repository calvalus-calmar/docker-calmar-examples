#!/bin/bash

# eodata - S1 SAR OCN - windshear at 100m above ocean surface
cd /data/eodag/
for filepath in `hdfs dfs -ls -C /calvalus/home/examples/S1_SAR_OCN_windshear_100m/*.seq`;
do
  filename="${filepath##*/}" 
  year=${filename:23:4};
  month=${filename:27:2};
  day=${filename:29:2};
  echo Uploading $filename to HDFS...
  hdfs dfs -mkdir -p /calvalus/eodata/S1_SAR_OCN_windshear_100m/v1/$year/$month/$day/
  hdfs dfs -cp -f $filepath /calvalus/eodata/S1_SAR_OCN_windshear_100m/v1/$year/$month/$day/
done

