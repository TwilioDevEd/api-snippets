// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.TwiML;

public class VoiceController : Controller
{
  // /Voice
  public ActionResult Index()
  {
    var response = new VoiceResponse();
    response.Say("Hello. It's me.");
    response.Play("http://howtodocs.s3.amazonaws.com/ahoyhoy.mp3");
    return Content(response.ToString(), "text/xml");
  }
}
