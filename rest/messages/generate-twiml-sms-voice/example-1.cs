// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using Twilio.Mvc;
using Twilio.TwiML;
using Twilio.TwiML.Mvc;

public class HelloWorldController : TwilioController
{
  [HttpPost]
  public ActionResult Index(VoiceRequest request)
  {
    var response = new TwilioResponse();
    response.Say("Hello! You will get an SMS message soon.");
    response.Sms("This is the ship that made the Kessel Run in fourteen parsecs?");
    return TwiML(response);
  }
}