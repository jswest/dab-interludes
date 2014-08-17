// STANDARDIZE DPIC COUNTIES
//
// The aim of this script is to ensure the census name matches the dpic name
// DPIC doesn't have "county" or "parish" or "borough" after most of its county names
// whereas the census data did. We're going to have the type of the jurisdiction in the final
// map so it's saved as a seperate entry in the clean-fips.json file.

// require the fs module so we can write files
var fs = require('fs');

// require the nonstandard dpic counties and the dpic database
var dpic                = require('./../data/raw/dpic/dpic.json')
,   nonstandardCounties = require('./../data/raw/counties/nonstandard-dpic-county-names.json');

// require the full fips file
var fips                = require('./../data/raw/counties/clean-fips.json');

// iterate over the dpic adjusting for nonstandard county spellings
for (var i = 0; i < dpic.length; i++) {
  if (nonstandardCounties.indexOf(dpic[i].county) > -1) {
    dpic[i].county = dpic[i].county.replace(/parish/g, "").trim();
    dpic[i].county = dpic[i].county.replace("county", "").trim();
    dpic[i].county = dpic[i].county.replace("ft. bend", "fort bend");
    if (dpic[i].state === 'al') {
      dpic[i].county = dpic[i].county.replace(/russel/g, "russell");
    }
    if (dpic[i].state === 'va') {
      dpic[i].county = dpic[i].county.replace(/staunton/g, "staunton city");
      dpic[i].county = dpic[i].county.replace(/manassas/g, "manassas city");
    }
    if (dpic[i].state === 'mt') {
      dpic[i].county = dpic[i].county.replace(/powel/g, "powell");
    }
    if (dpic[i].state === 'ga') {
      dpic[i].county = dpic[i].county.replace(/gwinnet/g, "gwinnett");
    }
    if (dpic[i].state === 'fl') {
      dpic[i].county = dpic[i].county.replace(/escabia/g, "escambia");
    }
    if (dpic[i].state === 'ok') {
      dpic[i].county = dpic[i].county.replace(/pittsburgh/g, "pittsburg");
    }
  }
}

nonstandardDpicCountyNames = [];
for (var i = 0; i <dpic.length; i++) {
  var county = dpic[i].county;

  var match = false;
  for (var j = 0; j < fips.length; j++) {
    if (fips[j].name === county && fips[j].state.toLowerCase() === dpic[i].state) {
      match = true;
      break;
    }
  }
  if (!match && nonstandardDpicCountyNames.indexOf(county) === -1) {
    nonstandardDpicCountyNames.push(dpic[i].state);
  }  
}
console.log(nonstandardDpicCountyNames);

fs.writeFile(
  'data/raw/dpic/dpic-corrected-counties.json',
  JSON.stringify(dpic),
  function (error) { console.log(error ? error : "file written."); }
);