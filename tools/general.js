const fs = require('fs');
// import file from first argument
const imported = require(process.argv[2]);

const statement_count = imported.statement.length;
const party_count = imported.party.length;
let party = []
let statement = []
let opinion = []

// in js the array ist
for (let i = 0; i < statement_count; i++) {
    statement.push({id: i, category: null, label: imported.statement[i][0][0], text: imported.statement[i][0][1]});
}

for (let i = 0; i < party_count; i++) {
    party.push({id: i, name: imported.party[i][0][1], longname: imported.party[i][0][0]});
}

// in js the array ist [statements][party]
for (let i = 0; i < party_count; i++) {
    for (let j = 0; j < statement_count; j++) {
	    opinion.push({id: i * statement_count + j, party: i, statement: j, answer: imported.opinion[j][i], comment: i * statement_count + j});
    }
}

// write json file
let data = JSON.stringify(party);
fs.writeFileSync('party.json', data);

data = JSON.stringify(statement);
fs.writeFileSync('statement.json', data);

data = JSON.stringify(opinion);
fs.writeFileSync('opinion.json', data);
