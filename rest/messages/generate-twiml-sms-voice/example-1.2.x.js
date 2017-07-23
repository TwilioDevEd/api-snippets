const http = require('http');
const twilio = require('twilio');

http
  .createServer((req, res) => {
    // Create TwiML response
    const twiml = new twilio.TwimlResponse();
    twiml.say('Hello! You will get an SMS message soon.');
    twiml.sms('This is the ship that made the Kessel Run in fourteen parsecs?');

    res.writeHead(200, { 'Content-Type': 'text/xml' });
    res.end(twiml.toString());
  })
  .listen(1337, '127.0.0.1');

console.log("TwiML servin' server running at http://127.0.0.1:1337/");
