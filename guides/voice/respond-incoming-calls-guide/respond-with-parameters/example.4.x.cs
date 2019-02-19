// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.Mvc;
using Twilio.TwiML;
using Twilio.TwiML.Mvc;

public class VoiceController : TwilioController
{
  [HttpPost]
  public TwiMLResult Index(VoiceRequest request)
  {
    // Get information about the incoming call, like the city associated
    // with the phone number (if Twilio can discover it)
    var city = request.FromCity;

    var response = new TwilioResponse();
    response.Say($"Never gonna give you up {city}", new {voice = "alice"});
    response.Play("https://demo.twilio.com/docs/classic.mp3");
    return TwiML(response);
  }
}
