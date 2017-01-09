// In Package Manager, run:
// Install-Package Twilio.Mvc -Pre

using System.Web.Mvc;
using Twilio.TwiML;

public class VoiceController : Controller
{
    [HttpPost]
    public ActionResult Index(string fromCity)
    {
        // Get information about the incoming call, like the city associated
        // with the phone number (if Twilio can discover it)
        var city = fromCity;

        var response = new VoiceResponse();
        response.Say($"Never gonna give you up {city}", voice: "alice");
        response.Play("https://demo.twilio.com/docs/classic.mp3");

        return Content(response.ToString(), "text/xml")
    }
}
