const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const start = response.start();
start.transcription({statusCallbackUrl: 'https://example.com/your-callback-url', hints: 'Alice Johnson, Bob Martin, ACME Corp, XYZ Enterprises, product demo, sales inquiry, customer feedback'});

console.log(response.toString());
