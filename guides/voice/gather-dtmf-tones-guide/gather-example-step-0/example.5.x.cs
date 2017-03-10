// In Package Manager, run:
// Install-Package Twilio.AspNet.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.AspNet.Mvc;
using Twilio.TwiML;

public class VoiceController : TwilioController
{
    [HttpPost]
    public ActionResult Index()
    {
        var response = new VoiceResponse();

        // Use the <Gather> verb to collect user input
        response.Gather(new Gather(numDigits: 1)
		                .Say("For sales, press 1. For support, press 2."));
        // If the user doesn't enter input, loop
        response.Redirect("/voice");

        return TwiML(response);
    }
}
