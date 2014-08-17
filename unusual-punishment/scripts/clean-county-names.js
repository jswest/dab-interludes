// CLEAN COUNTY NAMES
//
// Since the county names as found in the DPIC do not having a trailing "county"
// (As in Hennipen rather than Hennipen County)
// We need to strip the word County (or Borough or Parish or City) from the
// list of fips codes found in the census data.
// We'll keep them saved with their jurisdiction type attached so that we can display
// off of that.
//
// We're also going to check at the end that we can merge the files.
// That is, we'll check that I correctly removed everything.

// config
var fipsPath = 'data/raw/counties/fips.csv';
var dpicPath = 'data/raw/counties/dpic-counties.json';

// require the module to write files
var fs = require('fs');

// require the module to read csv
var csv = require('csv');

// require the necessary files
var dpic = require('./../' + dpicPath);
var fips = fs.readFileSync(fipsPath).toString(); // i'm super lazy

// create a holder for the cleanly names
var entries = [];

// use the csv module to turn the fips csv string to an array
csv()
  .from.string(fips)
  .to.array(function (codes) {

    // the header row is probably not needed.
    var header = codes[0];

    // iterate over the rest of the array.
    for (var i = 1; i < codes.length; i++) {
      var code = codes[i];

      // variables for the different fields
      var state    = code[0]
      ,   stateId  = code[1]
      ,   countyId = code[2]
      ,   county   = code[3];

      // clean up the county name
      var cleanCountyName = "";
      var countyNameArray = county.toLowerCase().split(' ');
      if (countyNameArray.length > 1 && countyNameArray[countyNameArray.length - 1] !== "city") {
        countyNameArray.pop();
        cleanCountyName = countyNameArray.join(' ');
      } else {
        cleanCountyName += countyNameArray.join(' ');
      }

      // push the revised entry.
      entries.push({
        "state": state,
        "stateId": stateId,
        "countyId": countyId,
        "id": stateId + "" + countyId,
        "name": cleanCountyName,
        "longname": county
      });
    }

    // check these names against the dpic-counties list
    var nonstandardDpicCountyNames = [];
    for (var i = 0; i < dpic.length; i++) {
      var county = dpic[i];

      var match = false;
      for (var j = 0; j < entries.length; j++) {
        if (entries[j].name === county) {
          match = true;
          break;
        }
      }
      if (!match) {
        nonstandardDpicCountyNames.push(county);
      }
    }

    // write the list of non-standard DPIC county names
    fs.writeFile(
      'data/raw/counties/nonstandard-dpic-county-names.json',
      JSON.stringify(nonstandardDpicCountyNames),
      function (error) { console.log(error ? error : "nonstandard dpic county names file written."); }
    );

    // write the JSON of counties
    fs.writeFile(
      'data/raw/counties/clean-fips.json',
      JSON.stringify(entries),
      function (error) { console.log(error ? error : "clean fips file written.") }
    );

  });