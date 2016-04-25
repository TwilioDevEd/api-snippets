// Download the twilio-csharp library from twilio.com/docs/csharp/install
using Twilio.TwiML;
using Twilio.TwiML.Mvc;

private static TwiMLResult ConnectAgent()
{
    var twiml = new TwilioResponse();
    twiml.BeginDial()
          .Queue("Queue Demo")
          .EndDial();
    return new TwiMLResult(twiml);
}