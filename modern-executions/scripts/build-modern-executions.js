// okay
// here's what you need
// data/
//   raw/
//     dpic/
//       dpic.csv
//
// then run `npm install shelljs`
// then run `node scripts build.js`
// enjoy.

require('shelljs/global');

exec('node scripts/dpic-to-json.js');