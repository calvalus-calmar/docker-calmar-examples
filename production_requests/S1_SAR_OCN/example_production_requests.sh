#!/bin/bash

# Various example productions using Sentinel-1 SAR Level-2 (Ocean) OCN data (Calvalus L2Plus productions)

### Test 1: Wind maps - 10 metres
# Clean any existing outputs
hdfs dfs -rm -r -f /calvalus/home/examples/S1_SAR_OCN_restructured /calvalus/home/examples/S1_SAR_OCN_restructured-output

# Run OCN restructure/geocoding processor
java com.bc.calvalus.production.cli.ProductionTool -e S1-SAR-OCN-restructure-geocoding.xml

# Copy outputs to Calvalus EO root
(cd /examples/data; bash data_S1_SAR_OCN_restructured.sh)

# Generate monthly wind maps at 10 metres
java com.bc.calvalus.production.cli.ProductionTool -e S1-SAR-OCN-restructure-geocoding-mosaick.xml


### Test 2: Wind maps - 100 metres
# Clean any existing outputs
hdfs dfs -rm -r -f /calvalus/home/examples/S1_SAR_OCN_windshear_100m /calvalus/home/examples/S1_SAR_OCN_windshear_100m-output

# Run OCN vertical wind shear processor
java com.bc.calvalus.production.cli.ProductionTool -e S1-SAR-OCN-windshear-100m.xml

# Copy outputs to Calvalus EO root
(cd /examples/data; bash data_S1_SAR_OCN_windshear_100m.sh)

# Generate monthly wind maps at 100 metres
java com.bc.calvalus.production.cli.ProductionTool -e S1-SAR-OCN-windshear-100m-mosaick.xml

