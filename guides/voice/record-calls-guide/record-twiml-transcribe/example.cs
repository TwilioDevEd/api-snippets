// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.Mvc;
using Twilio.TwiML;
using Twilio.TwiML.Mvc;

public class RecordController : TwilioController
{
  [HttpPost]
  public TwiMLResult Index(VoiceRequest request)
  {
    var response = new TwilioResponse();
    
    // Use <Say> to give the caller some instructions
    response.Say("Hello. Please leave a message and I will transcribe it.");

    // Use <Record> to record and transcribe the caller's message
    response.Record(new { transcribe = true, maxLength = 30 });

    // End the call with <Hangup>
    response.Hangup();

    return TwiML(response);
  }
}