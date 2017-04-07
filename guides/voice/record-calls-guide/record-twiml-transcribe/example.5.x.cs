// In Package Manager, run:
// Install-Package Twilio.AspNet.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.TwiML;

public class RecordController : TwilioController
{
    [HttpPost]
    public ActionResult Index()
    {
        var response = new VoiceResponse();

        // Use <Say> to give the caller some instructions
        response.Say("Hello. Please leave a message and I will transcribe it.");

        // Use <Record> to record and transcribe the caller's message
        response.Record(transcribe: true, maxLength: 30);

        // End the call with <Hangup>
        response.Hangup();

        return Content(response.ToString(), "text/xml");
    }
}
