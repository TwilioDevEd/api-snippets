const VoiceResponse = require("twilio").twiml.VoiceResponse;

const response = new VoiceResponse();
const dial = response.dial({
  referUrl: "https://example.com/handler",
});
dial.sip(
  "sip:AgentA@xyz.sip.us1.twilio.com?User-to-User=123456789%3Bencoding%3Dhex&X-Name=Agent%2C+A"
);

console.log(response.toString());
