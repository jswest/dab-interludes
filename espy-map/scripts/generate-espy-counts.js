/*
The aim of this script is to return a JSON object with the following structure:
[
  {
    "year": [number: year],
    "counties": [
      {
        "county": [string: fips code],
        "count": [number: number of executions]
      },
      ...
    ]
  },
  ...
]
*/


// config
var espyPath = 'data/raw/espy/DS0001/08451-0001-Data.txt'
,   uglyPath = 'data/raw/espy/espy-by-year-by-county.json'
,   nicePath = 'data/raw/espy/espy-by-year-by-county.pretty.json'


// we need the fs module to write files.
var fs = require('fs');

// get the espy file and split it into an array of lines
var lines = fs.readFileSync(espyPath) // lazy
  .toString()
  .split( "\n" );

// first, generate the basic structure of the final data.
var counties = []; // for verification.
var data = [];
for (var i = 1776; i <= 2002; i++) { // we're only interested in these years.
  data.push({ "year": i.toString(), "counties": [] });
}

for (var i = 0; i < lines.length - 1; i++) {

  // for my sanity.
  console.log(i.toString() + '/' + (lines.length - 1));

  // get the pertinent information from espy
  var line = lines[i];
  var year   = line.slice('53', '57')
  ,   county = parseInt(line.slice('61', '66'));
  
  // iterate to find the right year in the data array.
  for (var j = 0; j < data.length; j++) {
    if (data[j].year === year) {
      
      // iterate to find the right county in the data array--
      // if it exists
      var countyExists = false;
      for (var k = 0; k < data[j].counties.length; k++) {
        if (data[j].counties[k].county === county) {
          countyExists = true;
          data[j].counties[k].count++; // iterate the county's count.
          break; // spare my computer the trouble.
        }
      }

      // if it doesn't, then create it with a count of 1
      if (!countyExists) {
        data[j].counties.push({ "county": county, "count": 1 });
      }
      break; // spare my computer the trouble.
    }
  }

  if (counties.indexOf(county) === -1) {
    counties.push(county);
  }
}

fs.writeFile(
  uglyPath,
  JSON.stringify(data),
  function (error) { error ? error : "ugly file written." }
);
fs.writeFile(
  nicePath,
  JSON.stringify(data, null, 2),
  function (error) { error ? error : "nice file written." }
);
fs.writeFile(
  'data/raw/counties/espy-counties.json',
  JSON.stringify(counties),
  function (error) { error ? error : "counties file written." }
);