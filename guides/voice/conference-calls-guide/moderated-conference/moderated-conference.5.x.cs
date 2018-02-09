// In Package Manager, run:
// Install-Package Twilio.AspNet.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.AspNet.Mvc;
using Twilio.TwiML;

public class VoiceController : TwilioController
{
    private const string Moderator = "+15558675310";

    [HttpPost]
    public ActionResult Index(string from)
    {
        var response = new VoiceResponse();
        var dial = new Dial();

        // If the caller is our MODERATOR, then start the conference when they
        // join and end the conference when they leave
        if (from == Moderator)
        {
            dial.Conference("My conference",
                            startConferenceOnEnter: true,
                            endConferenceOnExit: true);
        }
        else
        {
            // Otherwise have the caller join as a regular participant
            dial.Conference("My conference",
                            startConferenceOnEnter: false);
        }

        response.Dial(dial);

        return TwiML(response);
    }
}
