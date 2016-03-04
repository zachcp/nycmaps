Borough_Boundaries.geojson:
	wget -O $@ https://data.cityofnewyork.us/api/geospatial/tqmj-j8zm?method=export\&format=GeoJSON

# use mapshaper.org to simplyify
Boundaries.geojson: Borough_Boundaries.geojson
	mapshaper -i $< -simplify dp 20% keep-shapes -o format=geojson $@

#nyc_triplet.csv: Borough_Boundaries.geojson
nyc_triplet.csv: Boundaries.geojson
	python process_geojson.py

nyc.name: nyc_triplet.csv
	Rscript process_geojson.R

all: nyc.name

clean:
	rm nyc.*
	rm ../inst/mapdata/nyc*
