// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.Mvc;
using Twilio.TwiML;
using Twilio.TwiML.Mvc;

public class VoiceController : TwilioController
{
  // Update with your own phone number in E.164 format
  private const string Moderator = "+15558675310";

  [HttpPost]
  public TwiMLResult Index(VoiceRequest request)
  {
    var response = new TwilioResponse();

    object conferenceOptions;

    // If the caller is our MODERATOR, then start the conference when they
    // join and end the conference when they leave
    if (request.From == Moderator)
    {
      conferenceOptions = new
      {
        startConferenceOnEnter = true,
        endConferenceOnExit = true
      };
    }
    else
    {
      // Otherwise have the caller join as a regular participant
      conferenceOptions = new {startConferenceOnEnter = false};
    }

    response.DialConference("My conference", conferenceOptions);

    return TwiML(response);
  }
}