var fs  = require('fs')
,   csv = require('csv');

var rawExecutions = fs.readFileSync('data/raw/dpic/dpic.csv').toString();
var executions = [];

csv()
  .from.string(rawExecutions)
  .to.array(function (data) {
    for (var i = 1; i < data.length; i++) {
      var headers = data[0];
      var execution = {};
      for (var j = 0; j < headers.length; j++) {
        var key = data[0][j].trim().toLowerCase();
        execution[key] = data[i][j].trim().toLowerCase();
      }
      executions.push(execution);
    }
    executions = executions.sort(function (a, b) {
      if (Date.parse(a.date) > Date.parse(b.date)) {
        return 1;
      } else {
        return -1;
      }
    });
    fs.writeFile(
      'data/raw/dpic/dpic.json',
      JSON.stringify(executions),
      function (error) {
        if (error) {
          console.log(error);
        }
        else {
          console.log('ugly file written.');
        }
      }
    );
  });