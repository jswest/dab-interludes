var fs = require('fs');
var csv = require('csv');

var words = require('./../data/raw/old-last-words.json');

var statements = fs.readFileSync('data/raw/chosen-words-and-statements.csv').toString();

var clean = function (input) {
  var tmp = input.trim();
      tmp = tmp.replace(/\\r\\n/g, "");
      tmp = tmp.replace("<br />", "");
      tmp = tmp.replace(/  /g, ' ');
  return tmp;
};



var topWords = words.splice(0,50);

var combinedWords = [];

csv()
  .from(statements)
  .to.array(function (data) {
    for (var i = 0; i < data.length; i++) {
      var entry = {};
      var word = data[i][1].toLowerCase();
      var name = data[i][2].toLowerCase();
      var statement = clean(data[i][4]);
      //console.log(word);
      //console.log(name);
      //console.log(clean(statement));
      //console.log();

      var foundMatch = false;
      for (var j = 0; j < topWords.length; j++) {
        if (topWords[j].word === word) {
          foundMatch = true;
          entry.count = topWords[j].count;
          entry.word = word;
          entry.name = name;
          entry.statement = statement;
          break;
        }
      }
      if (!foundMatch) {
        console.log('alert! ' + i );
      } else {
        combinedWords.push(entry);
      }
    }
    fs.writeFile(
      'data/last-words.json',
      JSON.stringify(combinedWords),
      function (error) { error ? error : "file written." }
    );
  });


