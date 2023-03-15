// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.TwiML;

public class VoiceController : Controller
{
    // /Voice
    public ActionResult Index()
    {
        var response = new VoiceResponse();
        response.Say("Hello from your pals at Twilio! Have fun.");
        return Content(response.ToString(), "text/xml");
    }
}
