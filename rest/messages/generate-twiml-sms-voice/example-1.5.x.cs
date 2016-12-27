// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor
using System.Web.Mvc;
using Twilio.TwiML;

public class HelloWorldController : Controller
{
    [HttpPost]
    public ActionResult Index()
    {
        var voiceResponse = new VoiceResponse();
        voiceResponse.Say("Hello! You will get an SMS message soon.");
        voiceResponse.Sms("This is the ship that made the Kessel Run in fourteen parsecs?");

        return Content(voiceResponse.ToString(), "text/xml");
    }
}
