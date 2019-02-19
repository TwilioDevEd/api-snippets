// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.Mvc;
using Twilio.TwiML;
using Twilio.TwiML.Mvc;

public class SmsHelloMonkey : TwilioController
{
    [HttpPost]
    public ActionResult Index(SmsRequest request)
    {
        var response = new TwilioResponse();
        response.Message("Hello, Mobile Monkey");
        return TwiML(response);
    }
}
