var http = require('http');

function buildHandler() {
    http.get('localhost:3000/buildhandler');
}

setInterval(function () {
    buildHandler();
    console.log("Running buildhandler--")
}, 10000);