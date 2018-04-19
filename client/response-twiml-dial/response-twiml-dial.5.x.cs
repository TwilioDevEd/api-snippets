// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.TwiML;

public class VoiceController : Controller
{
    [HttpPost]
    public ActionResult Index(VoiceRequest request)
    {
        var response = new VoiceResponse();
        if (!string.IsNullOrEmpty(request.To))
        {
            var number = new Dial(callerId: "+15017122661");
            number.Number(Request.To);

            response.Dial(number);
        }
        else
        {
            response.Say("Thanks for calling!");
        }

        return Content(response.ToString(), "text/xml");
    }
}
