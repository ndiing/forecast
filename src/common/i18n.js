const messages = require("../../_locales/id/messages.json");

class I18n {
    static getMessage(name, ...args) {
        let i = -1;
        return messages?.[name]?.message?.replace(/(%s)/g, () => args[++i]);
    }
}

module.exports = I18n;

// Usage
// console.log(I18n.getMessage("name", "1"));
