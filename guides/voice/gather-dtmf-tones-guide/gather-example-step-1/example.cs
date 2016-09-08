// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.Mvc;
using Twilio.TwiML;
using Twilio.TwiML.Mvc;

public class VoiceController : TwilioController
{
  // helper function to set up a <Gather>
  private static void RenderMainMenu(TwilioResponse response)
  {
    response.BeginGather(new { numDigits = 1 });
    response.Say("For sales, press 1. For support, press 2.");
    response.EndGather();

    // If the user doesn't enter input, loop
    response.Redirect("/voice");
  }

  [HttpPost]
  public TwiMLResult Index(VoiceRequest request)
  {
    var response = new TwilioResponse();

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
          RenderMainMenu(response);
          break;
      }
    }
    else
    {
      // If no input was sent, use the <Gather> verb to collect user input
      RenderMainMenu(response);
    }

    return TwiML(response);
  }
}