const http = require('http');
const VoiceResponse = require('twilio').twiml.VoiceResponse;

http
  .createServer((req, res) => {
    // Create TwiML response
    const twiml = new VoiceResponse();

    twiml.say("Hello. It's me.");
    twiml.play({}, 'https://deved-sample-assets-2691.twil.io/ahoyhoy.mp3');

    res.writeHead(200, { 'Content-Type': 'text/xml' });

    res.end(twiml.toString());
  })
  .listen(1337, '127.0.0.1');

console.log('TwiML server running at http://127.0.0.1:1337/');
