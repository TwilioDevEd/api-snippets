// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using Twilio.Mvc;
using Twilio.TwiML;
using Twilio.TwiML.Mvc;

public class VoiceController : TwilioController
{
  // /Voice/HandleGather
  public TwiMLResult HandleGather(VoiceRequest request)
  {
    var response = new TwilioResponse();
    switch (request.Digits)
    {
      case "1":
        response.Dial("+13105551212");
        response.Say("The call failed or the remote party hung up.  Goodbye.");
        break;
      case "2":
        response.Say("Record your message after the tone.");
        response.Record(new {maxLength = "30", action = "/Voice/HandleRecord"});
        break;
      default:
        response.Redirect("/Voice");
        break;
    }
    return TwiML(response);
  }
}