var fs = require('fs')
,   csv = require('csv')

var counties = [];
var rawCounties = [];
var codes = fs.readFileSync('data/raw/counties/county-fips.csv').toString();
csv()
  .from.string(codes)
  .to.array(function (rows) {
    for (var i = 0; i < rows.length; i++) {
      var row = rows[i];
      counties.push({
        "id": parseInt(row[0].trim()),
        "name": row[1].trim()
      });
      rawCounties.push(parseInt(row[0].trim()));
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