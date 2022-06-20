#!/bin/bash

# eodata - S1 SAR OCN
cd /data/eodag/
for filename in `ls S1*OCN*.zip`;
do
  year=${filename:17:4};
  month=${filename:21:2};
  day=${filename:23:2};
  echo Uploading $filename to HDFS...
  hdfs dfs -mkdir -p /calvalus/eodata/S1_SAR_OCN/v1/$year/$month/$day/
  hdfs dfs -copyFromLocal -f $filename /calvalus/eodata/S1_SAR_OCN/v1/$year/$month/$day/
done

