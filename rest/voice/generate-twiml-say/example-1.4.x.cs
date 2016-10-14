// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using Twilio.Mvc;
using Twilio.TwiML;
using Twilio.TwiML.Mvc;

public class VoiceController : TwilioController
{
  // /Voice
  public TwiMLResult Index(VoiceRequest request)
  {
    var response = new TwilioResponse();
    response.Say("Hello. It's me. I've been wondering if after this guide you'd like to meet.");
    return TwiML(response);
  }
}