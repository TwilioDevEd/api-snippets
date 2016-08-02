Response.ContentType = "text/xml";
var twiml = new Twilio.TwiML.TwilioResponse();

twiml.Say("Hello. It's me.")
twiml.Play("http://ia600303.us.archive.org/4/items/Wednesdy-tuesdy-ramblinSound/Wednesdy-tuesdyRamblinSound.mp3")