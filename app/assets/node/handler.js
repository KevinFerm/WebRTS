var http = require('http');

function buildHandler() {
    http.get('http://localhost:3000/buildhandler');
}

setInterval(function () {
    buildHandler();
    console.log("Running buildhandler--")
}, 10000);