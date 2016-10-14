// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using Twilio.Mvc;
using Twilio.TwiML;
using Twilio.TwiML.Mvc;

public class VoiceController : TwilioController
{
  // /Voice
  public TwiMLResult Index(VoiceRequest request)
  {
    var response = new TwilioResponse();
    response.Say("Hello. It's me.", new {voice = "alice", language = "en-GB"});
    response.Play("http://howtodocs.s3.amazonaws.com/ahoyhoy.mp3");
    response.BeginGather(new {numDigits = "1", action = "/Voice/HandleGather"});
    response.Say("To speak to a real person, press 1.\n" +
      "Press 2 to record a message for a Twilio educator.\n" +
      "Press any other key to start over.");
    response.EndGather();
    return TwiML(response);
  }

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