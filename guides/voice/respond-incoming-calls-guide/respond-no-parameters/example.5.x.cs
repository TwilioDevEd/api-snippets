// In Package Manager, run:
// Install-Package Twilio.AspNet.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.AspNet.Mvc;
using Twilio.TwiML;

public class VoiceController : TwilioController
{
    [HttpPost]
    public ActionResult Index()
    {
        var response = new VoiceResponse();
        response.Say("hello world!", voice: "alice");

        return TwiML(response);
    }
}
