var http = require('http');

function buildHandler() {
    http.get('http://localhost:3000/buildhandler');
}
function moveHandler() {
    http.get('http://localhost:3000/movehandler');
}

setInterval(function () {
    buildHandler();
    moveHandler();
    Console.log("Ran");
}, 10000);