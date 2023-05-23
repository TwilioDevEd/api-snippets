// In Package Manager, run:
// Install-Package Twilio.AspNet.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.AspNet.Mvc;
using Twilio.TwiML;

public class VoiceController : TwilioController
{
    [HttpPost]
    public ActionResult Index(string fromCity)
    {
        // Get information about the incoming call, like the city associated
        // with the phone number (if Twilio can discover it)
        var city = fromCity;

        var response = new VoiceResponse();
        response.Say($"Never gonna give you up {city}");
        response.Play("https://demo.twilio.com/docs/classic.mp3");

        return TwiML(response)
    }
}
