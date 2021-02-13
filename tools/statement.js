const fs = require('fs');
// import file from first argument
const imported = require(process.argv[2]);

const statement_count = imported.comment.length;
const party_count = imported.comment[0].length;
let result = []

// in js the array ist [statements][party][comment]
let counter = 0;
for (let i = 0; i < party_count; i++) {
    for (let j = 0; j < statement_count; j++) {
	    result.push({id: i * statement_count + j, text: imported.comment[j][i][0]});
	    counter++;
    }
}

// write json file
let data = JSON.stringify(result);
fs.writeFileSync('comment.json', data);
