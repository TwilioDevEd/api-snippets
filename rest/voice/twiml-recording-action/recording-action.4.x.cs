// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using Twilio.Mvc;
using Twilio.TwiML;
using Twilio.TwiML.Mvc;

public class VoiceController : TwilioController
{
  // /Voice/HandleRecord
  public TwiMLResult HandleRecord(VoiceRequest request)
  {
    var response = new TwilioResponse();
    response.Say("Listen to your recorded message.");
    response.Play(request.RecordingUrl);
    response.Say("Goodbye.");
    return TwiML(response);
  }
}