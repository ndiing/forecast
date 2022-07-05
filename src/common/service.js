const fetch = require("node-fetch");
const fs = require("fs");
const path = require("path");
const HttpsProxyAgent = require("https-proxy-agent");

class Storage {
    constructor(data = {}) {
        for (const name in data) {
            this[name] = data[name];
        }
    }

    clear() {
        for (const name of Object.getOwnPropertyNames(this)) {
            this.removeItem(name);
        }
    }

    getItem(name) {
        return this[name];
    }

    key(index) {
        return Object.getOwnPropertyNames(this)[index];
    }

    removeItem(name) {
        delete this[name];
    }

    setItem(name, value) {
        this[name] = value;
    }
}

// Usage
// const localStorage = new Storage()
// localStorage.setItem('name1','value1')
// localStorage.setItem('name2','value2')
// console.debug(localStorage.getItem('name1'))
// localStorage.removeItem('name1')
// console.debug(localStorage.getItem('name1'))
// localStorage.clear()
// console.debug(localStorage)

class CookieStore {
    get cookie() {
        const _cookie = [];

        for (const name of Object.getOwnPropertyNames(this)) {
            _cookie.push(`${name}=${encodeURIComponent(this[name].value)}`);
        }
        return _cookie.join("; ");
    }

    set cookie(value) {
        // console.log(value);
        const cookies = Array.isArray(value) ? value : [value];

        for (const cookie1 of cookies) {
            const cookie2 = cookie1.split("; ");
            const _cookie = {};

            for (const cookie of cookie2) {
                const [name, value] = cookie.split("=");

                if (/^Expires$/i.test(name)) {
                    _cookie.expires = value;
                } else if (/^Max-Age$/i.test(name)) {
                    _cookie.maxAge = value;
                } else if (/^Domain$/i.test(name)) {
                    _cookie.domain = value;
                } else if (/^Path$/i.test(name)) {
                    _cookie.path = value;
                } else if (/^Secure$/i.test(name)) {
                    _cookie.secure = value;
                } else if (/^HttpOnly$/i.test(name)) {
                    _cookie.httpOnly = value;
                } else if (/^SameSite$/i.test(name)) {
                    _cookie.sameSite = value;
                } else {
                    _cookie.name = name;
                    _cookie.value = value;
                }
            }

            if (_cookie.value) {
                this.set(_cookie);
            } else {
                this.delete(_cookie);
            }
        }
    }

    constructor(data = {}) {
        for (const name in data) {
            this[name] = data[name];
        }
    }

    delete(name) {
        const cookie = typeof name == "string" ? { name } : name;
        delete this[cookie.name];
    }

    get(name) {
        const cookie = typeof name == "string" ? { name } : name;
        return this[cookie.name];
    }

    getAll(name) {
        const cookie = typeof name == "string" ? { name } : name;
        return this[cookie.name];
    }

    set(name, value) {
        const cookie = typeof name == "string" ? { name, value } : name;
        this[cookie.name] = cookie;
    }
}

// Usage
// const cookieStore = new CookieStore();
// cookieStore.set("name1", "value1");
// cookieStore.set("name2", "value2");
// console.debug(cookieStore.get("name1"));
// cookieStore.delete("name1");
// console.debug(cookieStore.get("name1"));
// console.debug(cookieStore);
// cookieStore.cookie = "name1=value1; name2=value2";
// console.debug(cookieStore.cookie);

class Observe {
    constructor(data = {}, write = () => {}) {
        const handler = {
            get(target, name, value) {
                if (typeof target[name] == "object" && !Array.isArray(target[name]) && target[name] !== null) {
                    return new Proxy(target[name], handler);
                }
                return target[name];
            },

            set(target, name, value) {
                const oldValue = target[name];

                if (oldValue == value) {
                    return true;
                }
                Reflect.set(target, name, value);
                write(data);
                return true;
            },

            deleteProperty(target, name) {
                const oldValue = target[name];

                if (oldValue == undefined) {
                    return true;
                }
                Reflect.deleteProperty(target, name);
                write(data);
                return true;
            },
        };
        return new Proxy(data, handler);
    }
}

// Usage
// const o = new Observe({}, console.log)
// o.name='value'
// o.name='value2'

class Store {
    constructor(file = "./data/data/data.json", data = {}) {
        this.file = file;
        this.data = data;
    }

    read(data = this.data) {
        try {
            data = JSON.parse(fs.readFileSync(this.file, "utf8"));
        } catch (error) {
            this.write(data);
        }
        return data;
    }

    write(data = this.data) {
        const dir = path.dirname(this.file);
        try {
            fs.readdirSync(dir);
        } catch (error) {
            fs.mkdirSync(dir, { recursive: true });
        }
        fs.writeFileSync(this.file, JSON.stringify(data));
    }
}

// Usage
// const store = new Store('./data/example/default.json', {})
// store.write({name:'value'})
// console.log(store.read())

process.env.NODE_TLS_REJECT_UNAUTHORIZED = 0;

class Service {
    get cookie() {
        return this.observe.cookieStore.cookie;
    }

    set cookie(value) {
        this.observe.cookieStore.cookie = value;
    }

    get localStorage() {
        return this.observe.localStorage;
    }

    get cookieStore() {
        return this.observe.cookieStore;
    }

    get headers() {
        return {};
    }

    constructor(file = "./data/data/data.json", data = {}) {
        this.store = new Store(file, data);
        data = this.store.read(data);
        data.localStorage = new Storage(data.localStorage);
        data.cookieStore = new CookieStore(data.cookieStore);
        this.observe = new Observe(data, () => {
            this.store.write(data);
        });
    }

    async fetch(url = "", options = {}) {
        options = {
            ...(process.env.NODE_ENV == "development" && { agent: new HttpsProxyAgent("http://127.0.0.1:8888") }),
            ...options,
            headers: {
                Connection: "keep-alive",
                ...(this.cookie && { Cookie: this.cookie }),
                "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36",
                ...this.headers,
                ...options.headers,
            },
        };
        const request = await fetch(url, options);

        const setCookie = request.headers.raw()["set-cookie"];

        if (setCookie) {
            this.cookie = setCookie;
            // console.log(this.cookie);
        }

        return request;
    }
}

// Usage
// const f = new Service('./data/tokopedia/tokopedia.json');
// f.fetch("https://mitra.tokopedia.com/");

Service.fetch = fetch;
Service.HttpsProxyAgent = HttpsProxyAgent;
Service.Storage = Storage;
Service.CookieStore = CookieStore;
Service.Observe = Observe;
Service.Store = Store;
module.exports = Service;
