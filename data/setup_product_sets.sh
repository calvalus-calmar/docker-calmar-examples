#!/bin/bash

# copy product set
hdfs dfs -mkdir -p /calvalus/eodata/
hdfs dfs -copyFromLocal -f eodata/product-sets.csv /calvalus/eodata/
