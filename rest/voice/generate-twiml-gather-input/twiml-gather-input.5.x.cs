// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.TwiML;

public class VoiceController : Controller
{
  // /Voice/HandleGather
  public ActionResult HandleGather()
  {
    var response = new VoiceResponse();
    switch (Request.Form["Digits"])
    {
      case "1":
        response.Dial("+13105551212");
        response.Say("The call failed or the remote party hung up.  Goodbye.");
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
}
