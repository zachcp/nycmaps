# borough boundaries downloaded as GeoJSON
# https://data.cityofnewyork.us/City-Government/Borough-Boundaries/tqmj-j8zm

import json
boros = json.loads(open('Borough_Boundaries.geojson').read())
boros = boros['features']

def get_triplets_from_multipolygon(coords):
    for l in coords:
        print("L: {}".format(len(l)))
        for m in l:
            print("M: {}".format(len(m)))

with open("nyc_triplet.csv",'w') as f:
    for boro in boros:
        name   = boro['properties']['boroname']
        coords = boro['geometry']['coordinates']
        for idx, member in enumerate(coords):
            newname = "{}_{}".format(name, idx)
            for poly in member:
                for point in poly:
                    lon,lat = point
                    f.write("{},{},{}\n".format(lon, lat, newname))
            f.write("NA,NA,{}\n".format(newname))
