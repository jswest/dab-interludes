var fs = require('fs');

var espy = require('./../data/raw/espy/espy-by-year-by-county.json');

var entry = false;
var data = [];
for (var i = 0; i < espy.length; i++) {

  if (i % 10 === 0 || i === espy.length - 1) {
    if (entry) {
      entry.endYear = espy[i-1].year;
      data.push(entry);
    }
    entry = {
      "startYear": espy[i].year,
      "counties": espy[i].counties
    };
  } else {
    var counties = espy[i].counties;
    for (var j = 0; j < counties.length; j++) {
      var county = counties[j];
      var extant = false;
      for (var k = 0; k < entry.counties.length; k++) {
        if (entry.counties[k].county === county.county) {
          entry.counties[k].count += county.count;
          extant = true;
        }
      }
      if (!extant) {
        entry.counties.push({
          "county": county.county,
          "count": county.count
        });
      }
    }
  }
}

fs.writeFile(
  'data/raw/espy/espy-by-decade-by-county.json',
  JSON.stringify(data),
  function (error) { error ? error : "ugly file written." }
);
fs.writeFile(
  'data/raw/espy/espy-by-decade-by-county.pretty.json',
  JSON.stringify(data, null, 2),
  function (error) { error ? error : "nice file written." }
);