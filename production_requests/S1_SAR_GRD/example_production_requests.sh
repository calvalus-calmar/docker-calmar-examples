#!/bin/bash

# Various example productions using Sentinel-1 SAR Level-1 Ground Range Detected (GRD) data (Calvalus L2Plus productions)

### Test 1: Terrain correction - full dataset
# Clean any existing outputs and run the production
hdfs dfs -rm -r -f /calvalus/home/examples/S1-SAR-GRD-terrain-correction /calvalus/home/examples/S1-SAR-GRD-terrain-correction-output
java com.bc.calvalus.production.cli.ProductionTool -e S1-SAR-GRD-terrain-correction.xml

### Test 2: Terrain correction - full dataset with quicklooks (quicklook fails with memory overflow issue)
# Clean any existing outputs and run the production
hdfs dfs -rm -r -f /calvalus/home/examples/S1-SAR-GRD-terrain-correction-ql /calvalus/home/examples/S1-SAR-GRD-terrain-correction-ql-output
java com.bc.calvalus.production.cli.ProductionTool -e S1-SAR-GRD-terrain-correction-ql.xml

### Test 3: Terrain correction - full dataset with subsampled quicklooks
# Clean any existing outputs and run the production
hdfs dfs -rm -r -f /calvalus/home/examples/S1-SAR-GRD-terrain-correction-ql-subsample /calvalus/home/examples/S1-SAR-GRD-terrain-correction-ql-subsample-output
java com.bc.calvalus.production.cli.ProductionTool -e S1-SAR-GRD-terrain-correction-ql-subsample.xml

### Test 4: Terrain correction - subset region of dataset with quicklooks
# Clean any existing outputs and run the production
hdfs dfs -rm -r -f /calvalus/home/examples/S1-SAR-GRD-terrain-correction-region-ql /calvalus/home/examples/S1-SAR-GRD-terrain-correction-region-ql-output
java com.bc.calvalus.production.cli.ProductionTool -e S1-SAR-GRD-terrain-correction-region-ql.xml

