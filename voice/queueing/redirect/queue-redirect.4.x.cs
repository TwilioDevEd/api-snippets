// Download the twilio-csharp library from twilio.com/docs/csharp/install
using Twilio.TwiML;
using Twilio.TwiML.Mvc;

private static TwiMLResult AutoConnect()
{
    var twiml = new TwilioResponse();
    twiml.Say("You will now be connected to the first caller in the queue.");
    twiml.BeginDial()
          .Queue("Queue Demo")
          .EndDial();
    twiml.Redirect();
    return new TwiMLResult(twiml);
}