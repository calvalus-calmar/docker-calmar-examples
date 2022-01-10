#!/bin/bash

# eodata - MERIS L1
hdfs dfs -mkdir -p /calvalus/eodata/MER_RR__1P/r03/2003/08/13/
hdfs dfs -copyFromLocal -f eodata/MER_RR__1P/r03/2003/08/13/MER_RR__1PNPDK20030813_175754_000026132019_00027_07596_4557.N1 /calvalus/eodata/MER_RR__1P/r03/2003/08/13/
