// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using System.Text.RegularExpressions;
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
        var callerId = "+15017122661";

        // wrap the phone number or client name in the appropriate TwiML verb
        // by checking if the number given has only digits and format symbols
        if (Regex.IsMatch(request.To, "^[\\d\\+\\-\\(\\) ]+$"))
        {
          response.Dial(new Number(request.To), new {callerId});
        }
        else
        {
          response.Dial(new Client(request.To), new {callerId});
        }
      }
      else
      {
        response.Say("Thanks for calling!");
      }
      return TwiML(response);
  }
}
