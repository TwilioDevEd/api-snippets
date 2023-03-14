// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.TwiML;

public class VoiceController : Controller
{
    // /Voice
    public ActionResult Index()
    {
        var gather = new Gather(numDigits: 1, action: "/Voice/HandleGather");
        gather.Say("To speak to a real person, press 1.\n" +
            "Press 2 to record a message for a Twilio educator.\n" +
            "Press any other key to start over.");

        var response = new VoiceResponse();
        response.Say("Hello. It's me.", voice: "alice", language: "en-GB");
        response.Play("https://deved-sample-assets-2691.twil.io/ahoyhoy.mp3");
        response.Gather(gather);

        return Content(response.ToString(), "text/xml");
    }

    // /Voice/HandleGather
    public ActionResult HandleGather()
    {
        var response = new VoiceResponse();
        switch (Request.Form["Digits"])
        {
            case "1":
                response.Dial("+13105551212");
                response.Say("The call failed or the remote party hung up.    Goodbye.");
                break;
            case "2":
                response.Say("Record your message after the tone.");
                response.Record(maxLength: 30, action: "/Voice/HandleRecord");
                break;
            default:
                response.Redirect("/Voice");
                break;
        }
        return Content(response.ToString(), "text/xml");
    }

    // /Voice/HandleRecord
    public ActionResult HandleRecord()
    {
        var response = new VoiceResponse();
        response.Say("Listen to your recorded message.");
        response.Play(Request.Form["RecordingUrl"]);
        response.Say("Goodbye.");
        return Content(response.ToString(), "text/xml");
    }
}
