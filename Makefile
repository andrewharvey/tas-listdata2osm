toGeoJSON:
	ogr2ogr -f 'GeoJSON' -t_srs 'EPSG:4326' -sql 'SELECT BUILD_TY AS type FROM "2D_BUILDING_POLYS"' data/building.geojson data/source_statewide/2D_BUILDING_POLYS.shp
	ogr2ogr -f 'GeoJSON' -t_srs 'EPSG:4326' -sql 'SELECT PID AS pid, TENURE_TY AS tenure FROM "PARCELS"' data/parcels.geojson data/source_statewide/PARCELS.shp
