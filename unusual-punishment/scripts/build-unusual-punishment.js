// okay
// here's what you need
// data/
//   raw/
//     maps/
//       us-10m.json
//     counties/
//       fips.csv
//     dpic
//       dpic.csv
//
// then run `npm install shelljs`
// then run `node scripts build.js`
// enjoy.

require('shelljs/global');

if (!which('topojson')) {
  echo('Sorry, this script requires topojson');
  exit(1);
}
if (!which('mapshaper')) {
  echo('Sorry, this script requires mapshaper');
  exit(1);
}

rm('data/us.topo.json');
rm('data/us.topo-index.json');

exec('node scripts/dpic-to-json.js');
exec('node scripts/isolate-dpic-counties.js');
exec('node scripts/clean-county-names.js');
exec('node scripts/standardize-dpic-counties.js');
exec('node scripts/merge-counts-and-fips.js');

exec('topojson data/raw/maps/us-10m.json -o data/raw/maps/us-10m.topo.json -e data/counties.csv -q 1e4 -p');
exec('mapshaper data/raw/maps/us-10m.topo.json -o data/us.topo.json --visvalingam');