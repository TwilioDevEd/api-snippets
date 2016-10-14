var http = require('http'),
    express = require('express'),
    bodyParser = require('body-parser');

var app = express();
app.use(bodyParser.urlencoded({ extended: true })); 

app.post('/MessageStatus', function(req, res) {
    var messageSid = req.body.MessageSid;
    var messageStatus = req.body.MessageStatus;
    console.log("SID: " + messageSid + ", Status: " + messageStatus);
    res.end();
});

http.createServer(app).listen(1337, function () {
    console.log("Express server listening on port 1337");
});