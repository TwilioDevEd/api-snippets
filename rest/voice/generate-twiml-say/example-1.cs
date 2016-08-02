Response.ContentType = "text/xml";
var twiml = new Twilio.TwiML.TwilioResponse();

twiml.Say("Hello. It's me. I've been wondering if after this guide you'd like to meet.")