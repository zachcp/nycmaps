# borough boundaries downloaded as GeoJSON
# https://data.cityofnewyork.us/City-Government/Borough-Boundaries/tqmj-j8zm

import json
import sys
geojsonfile = sys.argv[1]
print(geojsonfile)

boros = json.loads(open(geojsonfile).read())
boros = boros['features']

namelookup = {
  "Bronx_1":"Bronx: Rikers Island",
  "Bronx_7":"Bronx: City Island",
  "Bronx_8":"Bronx: Hart Island",
  "Bronx_23":"Bronx",
  "Brooklyn_2": "Brookyln: Jamaica Bay 1",
  "Brooklyn_4": "Brookyln: Jamaica Bay 2",
  "Brooklyn_14": "Brookyln: Jamaica Bay 3",
  "Brooklyn_15": "Brookyln: Jamaica Bay 4",
  "Brooklyn_21": "Brookyln: Jamaica Bay 5",
  "Brooklyn_12": "Brookyln: Jamaica Bay 6",
  "Brooklyn_13": "Brookyln: Jamaica Bay 7",
  "Brooklyn_16": "Brookyln: Jamaica Bay 8",
  "Brooklyn_26": "Brookyln",
  "Manhattan_4": "Manhattan: Statue Of Liberty Island",
  "Manhattan_5": "Manhattan: Governors Island",
  "Manhattan_25": "Manhattan: Roosevelt Island",
  "Manhattan_27": "Manhattan: Randalls Island",
  "Manhattan_31": "Manhattan",
  "Queens_19": "Queens",
  "Queens_0": "Queens",
  "Queens_1": "Queens: Jamaica Bay 1",
  "Queens_2": "Queens: Jamaica Bay 2",
  "Queens_13": "Queens: Jamaica Bay 3",
  "Queens_7": "Queens: Rockaways",
  "Queens_8": "Queens: Rockaways2",
  "Staten Island_3": "Staten Island"
}

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
            if newname in namelookup.keys():
              for poly in member:
                  for point in poly:
                      lon,lat = point
                      f.write("{},{},{}\n".format(lon, lat, namelookup[newname]))
              f.write("NA,NA,{}\n".format(newname))
