var http = require('http'),
    twilio = require('twilio');

http.createServer(function (req, res) {
    //Create TwiML response
    var twiml = new twilio.TwimlResponse();
    twiml.say("Hello. It's me.");
    twiml.play("http://ia600303.us.archive.org/4/items/Wednesdy-tuesdy-ramblinSound/Wednesdy-tuesdyRamblinSound.mp3");

    res.writeHead(200, {'Content-Type': 'text/xml'});
    res.end(twiml.toString());

}).listen(1337, '127.0.0.1');

console.log('TwiML servin\' server running at http://127.0.0.1:1337/');