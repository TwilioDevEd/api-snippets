// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.Mvc;
using Twilio.TwiML;
using Twilio.TwiML.Mvc;

public class SmsController : TwilioController
{
    [HttpPost]
    public ActionResult Index(SmsRequest request)
    {
        var response = new TwilioResponse();
        response.Message("The Robots are coming! Head for the hills!");
        return TwiML(response);
    }
}