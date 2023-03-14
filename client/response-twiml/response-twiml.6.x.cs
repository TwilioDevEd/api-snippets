// In Package Manager, run:
// Install-Package Twilio.AspNet.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.TwiML;

public class VoiceController : Controller
{
    [HttpPost]
    public ActionResult Index()
    {
        var response = new VoiceResponse();
        response.Say("Thanks for calling!");

        return Content(response.ToString(), "text/xml");
    }
}
