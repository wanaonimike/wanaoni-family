const fs = require("fs");
const path = "src/_data/dailyMessage.json";
const messages = [
  "Have a blessed day, Wanaoni Family!",
  "Don't forget Sunday service tomorrow.",
  "Family challenge: share your favorite memory."
];
const pick = messages[Math.floor(Math.random() * messages.length)];
const payload = {
  text: pick,
  color: "#" + Math.floor(Math.random() * 16777215).toString(16)
};
fs.writeFileSync(path, JSON.stringify(payload, null, 2));
