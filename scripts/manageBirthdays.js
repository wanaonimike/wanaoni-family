#!/usr/bin/env node
const fs = require('fs');
const filePath = 'src/_data/members.json';

// Parse arguments
const args = process.argv.slice(2);
const action = args[0];
const nameIdx = args.indexOf('--name');
const bdayIdx = args.indexOf('--birthday');

if (!['add','update'].includes(action) || nameIdx < 0 || bdayIdx < 0) {
  console.error('Usage: manageBirthdays.js add|update --name "Full Name" --birthday YYYY-MM-DD');
  process.exit(1);
}

const name = args[nameIdx + 1];
const bday = args[bdayIdx + 1];

if (!name || !bday) {
  console.error('Both --name and --birthday are required.');
  process.exit(1);
}

// Load members.json
let members;
try {
  members = JSON.parse(fs.readFileSync(filePath, 'utf8'));
} catch (e) {
  console.error('Cannot read', filePath);
  process.exit(1);
}

const idx = members.findIndex(m => m.name === name);

if (action === 'add') {
  if (idx !== -1) {
    console.error('Member "' + name + '" already exists.');
    process.exit(1);
  }
  members.push({ name: name, birthday: bday });
  console.log('Added "' + name + '" with birthday ' + bday + '.');
} else {
  if (idx === -1) {
    console.error('Member "' + name + '" not found.');
    process.exit(1);
  }
  members[idx].birthday = bday;
  console.log('Updated "' + name + '" to birthday ' + bday + '.');
}

fs.writeFileSync(filePath, JSON.stringify(members, null, 2));
