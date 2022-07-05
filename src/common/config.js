const fs = require("fs");
const Events = require("./events");
const config = JSON.parse(fs.readFileSync("./config.json", "utf8"));
config.events = new Events();

for (const name in config) {
    global[name] = config[name];
}

// Usage
// console.log(global);
