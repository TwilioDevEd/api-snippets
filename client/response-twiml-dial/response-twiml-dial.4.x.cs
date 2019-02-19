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
      if (!string.IsNullOrEmpty(request.To))
      {
        response.Dial(new Number(request.To), 
          new {callerId = "+15017122661"});
      }
      else
      {
        response.Say("Thanks for calling!");
      }
      return TwiML(response);
  }
}
