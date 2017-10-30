#!/bin/sh

mkdir -p data/source
mkdir -p data/by_layer
mkdir -p data/by_locality

get () {
    layer=$1
    locality=$2
    wget --directory-prefix="data/source" "http://listdata.thelist.tas.gov.au/opendata/data/LIST_${layer}_${locality}.zip"
    ln -s -T ../../source/LIST_${layer}_${locality}.zip data/by_layer/${layer}/${locality}.zip 
    ln -s -T ../../source/LIST_${layer}_${locality}.zip data/by_locality/${locality}/${layer}.zip 
}

mkdir data/by_layer/COASTLINE
mkdir data/by_layer/SURVEY_CONTROL
mkdir data/by_locality/STATEWIDE
get "COASTLINE" "STATEWIDE"
get "SURVEY_CONTROL" "STATEWIDE"

for layer in ADDRESS_POINTS PARCELS CONTOURS10M HYDAREA HYDLINE HYDPNT COMMUNITY_FACILITIES DEM_25M TRANSPORT_NODES TRANSPORT_SEGMENTS ; do
    mkdir -p data/by_layer/$layer
    for locality in BREAK_O_DAY BRIGHTON BURNIE CENTRAL_COAST CENTRAL_HIGHLANDS CIRCULAR_HEAD CLARENCE DERWENT_VALLEY DEVONPORT DORSET FLINDERS GEORGE_TOWN GLAMORGAN_SPRING_BAY GLENORCHY HOBART HUON_VALLEY KENTISH KINGBOROUGH KING_ISLAND LATROBE LAUNCESTON MEANDER_VALLEY NORTHERN_MIDLANDS SORELL SOUTHERN_MIDLANDS TASMAN WARATAH_WYNYARD WEST_COAST WEST_TAMAR ; do
        mkdir -p data/by_locality/$locality
        get "${layer}" "${locality}"
    done
done
