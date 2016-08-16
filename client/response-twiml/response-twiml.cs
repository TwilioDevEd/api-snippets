// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using Twilio.Mvc;
using Twilio.TwiML;
using Twilio.TwiML.Mvc;

public class VoiceController : TwilioController
{
  [HttpPost]
  public ActionResult Index(VoiceRequest request)
  {
    var response = new TwilioResponse();
    response.Say("Thanks for calling!");
    return TwiML(response);
  }
}