const members = require("./members.json");
const today = new Date().toISOString().slice(5,10);
const birthdays = members.filter(m => m.birthday.slice(5) === today);
module.exports = { birthdays };
