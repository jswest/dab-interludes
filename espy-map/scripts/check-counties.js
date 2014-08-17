var espy = require('./../data/raw/counties/espy-counties.json');
var fips = require('./../data/raw/counties/counties.json');

var wrong = [];
var num = 0;
for (var i = 0; i < espy.length; i++) {
  if (fips.indexOf(espy[i]) === -1) {
    wrong.push(espy[i]);
  }
}
console.log(espy.length);
console.log(wrong.length);
console.log(wrong);