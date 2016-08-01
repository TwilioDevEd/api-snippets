Response.ContentType = "text/xml";
var twiml = new Twilio.TwiML.TwilioResponse();

twiml.Message("The Robots are coming! Head for the hills!")