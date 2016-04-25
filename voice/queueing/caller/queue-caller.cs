// Download the twilio-csharp library from twilio.com/docs/csharp/install
using Twilio.TwiML;
using Twilio.TwiML.Mvc;

private static TwiMLResult QueueCaller()
{
    var twiml = new TwilioResponse();
    twiml.Enqueue("Queue Demo");
    return new TwiMLResult(twiml);
}