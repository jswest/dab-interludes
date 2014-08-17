var fs = require('fs')
,   csv = require('csv')



var isCounty = function (row) {
  if (row[6] === "County") { return true; }
  if (row[6] === "Parish") { return true; }
  if (row[6] === "Borough") { return true; }
  return false;
};

var counties = [];
var rawCounties = [];
var codes = fs.readFileSync('data/raw/counties/fips-codes.csv').toString();
csv()
  .from.string(codes)
  .to.array(function (rows) {
    var headerRow = rows[0];
    for (var i = 1; i < rows.length; i++) {
      var row = rows[i];

      if (isCounty(row)) {
        counties.push({
          "id": (parseInt(row[1]) +  "") + row[2],
          "name": row[5].toLowerCase(),
        });
        rawCounties.push((parseInt(row[1]) +  "") + row[2])
      }
    }
    var csvtext = "id,name\n";
    for (var i = 0; i < counties.length; i++) {
      csvtext += counties[i].id + ',' + counties[i].name + "\n";
    }
    fs.writeFile(
      'data/raw/counties/counties.csv',
      csvtext,
      function (error) { error ? error : "file written." }
    );
    fs.writeFile(
      'data/raw/counties/counties.json',
      JSON.stringify(rawCounties),
      function (error) { error ? error : "file written." }
    );
  });