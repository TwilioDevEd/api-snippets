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
    response.BeginGather(new
    {
      numDigits = 1,
      action = "/voice/gather"
    });
    response.Say("For sales, press 1. For support, press 2.");
    response.EndGather();

    // If the user doesn't enter input, loop
    response.Redirect("/voice");

    return TwiML(response);
  }

  [HttpPost]
  public TwiMLResult Gather(VoiceRequest request)
  {
    var response = new TwilioResponse();

    // If the user entered digits, process their request
    if (!string.IsNullOrEmpty(request.Digits))
    {
      switch (request.Digits)
      {
        case "1":
          response.Say("You selected sales. Good for you!");
          break;
        case "2":
          response.Say("You need support. We will help!");
          break;
        default:
          response.Say("Sorry, I don't understand that choice.").Pause();
          response.Redirect("/voice");
          break;
      }
    }
    else
    {
      // If no input was sent, redirect to the /voice route
      response.Redirect("/voice");
    }

    return TwiML(response);
  }
}