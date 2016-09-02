var http = require('http'),
    express = require('express');

var app = express();

app.get('/confirm', function(req, res) {
    var uniqueId = req.query.id;
    // Lookup variable `uniqueId` in a database to find messageSid
    var messageSid = 'SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

    // TODO: Implement

    res.end();
});

http.createServer(app).listen(1337, function () {
    console.log("Express server listening on port 1337");
});