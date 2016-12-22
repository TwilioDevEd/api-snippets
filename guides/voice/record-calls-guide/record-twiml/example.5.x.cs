// In Package Manager, run:
// Install-Package Twilio.Mvc -Pre

using System.Web.Mvc;
using Twilio.TwiML;

public class RecordController : Controller
{
    // [HttpPost]
    public ActionResult Index()
    {
        var response = new VoiceResponse();

        // Use <Say> to give the caller some instructions
        response.Say("Hello. Please leave a message after the beep.");

        // Use <Record> to record the caller's message
        response.Record();

        // End the call with <Hangup>
        response.Hangup();

        return Content(response.ToString(), "text/xml")
    }
}
