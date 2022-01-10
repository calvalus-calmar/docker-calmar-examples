#!/bin/bash

hdfs dfs -rm -r -f /calvalus/home/examples/*

# Example 1 - L2 production (SequenceFile output)
java com.bc.calvalus.production.cli.ProductionTool -e example1_L2_BandMaths_SequenceFile.xml
hdfs dfs -ls /calvalus/home/examples/example1_l2_bandmaths/
hdfs dfs -rm -r -f /calvalus/home/examples/example1_l2_bandmaths/

# Example 2 - L2Plus production (netCDF output)
java com.bc.calvalus.production.cli.ProductionTool -e example2_L2F_BandMaths_NetCDF.xml
hdfs dfs -ls /calvalus/home/examples/example2_l2f_bandmaths/
hdfs dfs -copyToLocal /calvalus/home/examples/example2_l2f_bandmaths/MER_RR__1PNPDK20030813_175754_000026132019_00027_07596_4557.nc.gz .
gunzip MER_RR__1PNPDK20030813_175754_000026132019_00027_07596_4557.nc.gz
gdalinfo -mm NETCDF:MER_RR__1PNPDK20030813_175754_000026132019_00027_07596_4557.nc:reflec_13
rm MER_RR__1PNPDK20030813_175754_000026132019_00027_07596_4557.nc
hdfs dfs -rm -r -f /calvalus/home/examples/example2_l2f_bandmaths/

# Example 3 - L2Plus production (netCDF and PNG quicklook outputs)
java com.bc.calvalus.production.cli.ProductionTool -e example3_L2Plus_BandMaths_PNG.xml
hdfs dfs -ls /calvalus/home/examples/example3_l2plus_bandmaths/
hdfs dfs -ls /calvalus/home/examples/example3_l2plus_bandmaths-output/
hdfs dfs -copyToLocal /calvalus/home/examples/example3_l2plus_bandmaths-output/L2_of_MER_RR__1PNPDK20030813_175754_000026132019_00027_07596_4557.png .
rm L2_of_MER_RR__1PNPDK20030813_175754_000026132019_00027_07596_4557.png
hdfs dfs -rm -r -f /calvalus/home/examples/example3_l2plus_bandmaths/
hdfs dfs -rm -r -f /calvalus/home/examples/example3_l2plus_bandmaths-output/

# Example 4 - QL production (PNG quicklook output)
java com.bc.calvalus.production.cli.ProductionTool -e example4_QL_PNG.xml
hdfs dfs -ls /calvalus/home/examples/example4_ql_png/
hdfs dfs -get /calvalus/home/examples/example4_ql_png/MER_RR__1PNPDK20030813_175754_000026132019_00027_07596_4557_RGB.png
rm MER_RR__1PNPDK20030813_175754_000026132019_00027_07596_4557_RGB.png
hdfs dfs -rm -r -f /calvalus/home/examples/example4_ql_png/

# Example 5 - QL production (GeoTIFF quicklook output)
java com.bc.calvalus.production.cli.ProductionTool -e example5_QL_GeoTIFF.xml
hdfs dfs -ls /calvalus/home/examples/example5_ql_geotiff/
hdfs dfs -get /calvalus/home/examples/example5_ql_geotiff/MER_RR__1PNPDK20030813_175754_000026132019_00027_07596_4557_RGB.tiff
gdalinfo MER_RR__1PNPDK20030813_175754_000026132019_00027_07596_4557_RGB.tiff
rm MER_RR__1PNPDK20030813_175754_000026132019_00027_07596_4557_RGB.tiff
hdfs dfs -rm -r -f /calvalus/home/examples/example5_ql_geotiff/

# Example 6 - QL production (COG quicklook output to GeoServer)
java com.bc.calvalus.production.cli.ProductionTool -e example6_QL_COG_and_GeoServer.xml
hdfs dfs -ls /calvalus/home/examples/example6_ql_cog/
hdfs dfs -get /calvalus/home/examples/example6_ql_cog/MER_RR__1PNPDK20030813_175754_000026132019_00027_07596_4557_RGB.tiff
gdalinfo MER_RR__1PNPDK20030813_175754_000026132019_00027_07596_4557_RGB.tiff
rm MER_RR__1PNPDK20030813_175754_000026132019_00027_07596_4557_RGB.tiff
hdfs dfs -rm -r -f /calvalus/home/examples/example6_ql_cog/
