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
    var response = new TwilioResponse();

    // Use the <Gather> verb to collect user input
    response.BeginGather(new {numDigits = 1});
    response.Say("For sales, press 1. For support, press 2.");
    response.EndGather();

    // If the user doesn't enter input, loop
    response.Redirect("/voice");

    return TwiML(response);
  }
}