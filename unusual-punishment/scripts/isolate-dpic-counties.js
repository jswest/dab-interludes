// ISOLATE DPIC COUNTIES
//
// the aim of this is to create a list of counites, parishes, and other jurisdictions
// where executions have taken place since 1977.
// It also creates that same list with the counts of executions for that county.
//
// it does this by iteratating over the dpic.json file,
// which was generated from the raw dpic.csv file,
// pulling the content of the "county" field, and
// saving the resulting array to a file.
//
// it will also save, in a seperate file, the 


// require the fs module to write files
var fs = require('fs');

// require the dpic database of executions
var executions = require('./../data/raw/dpic/dpic.json');

// create the variables that will hold the unique list of counties
// and the list of unique counites and executions therein committed.
var counties = [];
var counts = [];

// iterate over the dpic array of executions
for (var i = 0; i < executions.length; i++) {
  var execution = executions[i];
  var county = execution.county;

  // check if the county is already represented.
  // if it isn't, add it in.
  if (counties.indexOf(county) === -1) {
    counties.push(county);
  }

  // check if the county is in the counts array.
  // if it isn't, add it in.
  // if it is, increment it.
  var extant = false;
  for (var j = 0; j < counts.length; j++) {
    if (counts[j].county === county) {
      counts[j].count++;
      extant = true;
      break;
    }
  }
  if (!extant) {
    counts.push({
      "county": county,
      "count": 1
    });
  }
}

// sanity check
// then write the file
console.log('number of counties: ' + counties.length);
console.log('number of counties in counts: ' + counts.length );
if (counties.length !== counts.length) {
  console.log('woah! counties array does not equal counts array.');
}
else {
  fs.writeFile(
    'data/raw/counties/dpic-counties.json',
    JSON.stringify(counties),
    function (error) { console.log(error ? error : "counties file written."); }
  );
  fs.writeFile(
    'data/raw/counties/dpic-counties-with-counts.json',
    JSON.stringify(counts),
    function (error) { console.log(error ? error : "counts file written."); }
  );
}