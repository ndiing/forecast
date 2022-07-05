const EventEmitter = require("events");
const { isRegExp } = require("util/types");

class Events extends EventEmitter {
    on(name, listener) {
        name = isRegExp(name) ? name.source : name;
        super.on(name, listener);
    }

    emit(name, ...args) {
        for (const _name in this._events) {
            if (new RegExp(`^${_name}$`).test(name)) {
                if (_name == name) {
                    super.emit(_name, ...args);
                } else {
                    super.emit(_name, name, ...args);
                }
            }
        }
    }
}

module.exports = Events;

// Usage
// const e = new Events();
// e.on("hi", console.log);
// e.on(".*", console.log);
// e.on(/.*/, console.log);

// e.emit("hi", "forecast");
