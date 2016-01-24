Borough_Boundaries.geojson:
	wget -O $@ https://data.cityofnewyork.us/api/geospatial/tqmj-j8zm?method=export\&format=GeoJSON

nyc_triplet.csv: Borough_Boundaries.geojson
	python process_geojson.py

nyc.name: nyc_triplet.csv
	Rscript process_geojson.R

all: nyc.name

clean:
	rm nyc.*
	rm ../inst/mapdata/nyc*
