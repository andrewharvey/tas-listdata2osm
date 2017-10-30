#!/bin/bash

mkdir -p data/source_statewide

for layer in 2D_BUILDING_POLYS PARCELS ; do
    echo $layer
    for locality in BREAK_O_DAY BRIGHTON BURNIE CENTRAL_COAST CENTRAL_HIGHLANDS CIRCULAR_HEAD CLARENCE DERWENT_VALLEY DEVONPORT DORSET FLINDERS GEORGE_TOWN GLAMORGAN_SPRING_BAY GLENORCHY HOBART HUON_VALLEY KENTISH KINGBOROUGH KING_ISLAND LATROBE LAUNCESTON MEANDER_VALLEY NORTHERN_MIDLANDS SORELL SOUTHERN_MIDLANDS TASMAN WARATAH_WYNYARD WEST_COAST WEST_TAMAR ; do
        echo -n '.'

        if [ -e data/source_statewide/${layer}.shp ] ; then
            ogr2ogr -f 'ESRI Shapefile' -update -append -nln ${layer} data/source_statewide/${layer}.shp data/source_unzip/LIST_${layer}_${locality}/list_*.shp
        else
            ogr2ogr -f 'ESRI Shapefile' -nln ${layer} data/source_statewide/${layer}.shp data/source_unzip/LIST_${layer}_${locality}/list_*.shp
        fi
    done
    echo ''
done
