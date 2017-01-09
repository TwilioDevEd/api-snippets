// In Package Manager, run:
// Install-Package Twilio.Mvc -Pre

using System.Web.Mvc;
using Twilio.Mvc;
using Twilio.TwiML;
using Twilio.TwiML.Mvc;

public class VoiceController : Controller
{
    [HttpPost]
    public ActionResult Index()
    {
        var response = new VoiceResponse();
        response.Say("hello world!", voice: "alice");

        return Content(response.ToString(), "text/xml")
    }
}
