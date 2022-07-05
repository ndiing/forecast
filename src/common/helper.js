const moment = require("moment");
require("moment/locale/id");

class Helper {}

Helper.moment = moment;
module.exports = Helper;

// Usage
// console.log(Helper.moment())
