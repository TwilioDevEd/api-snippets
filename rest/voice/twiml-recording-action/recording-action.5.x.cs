// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.TwiML;

public class VoiceController : Controller
{
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
