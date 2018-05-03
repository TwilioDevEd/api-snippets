// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.Mvc;
using Twilio.TwiML;
using Twilio.TwiML.Mvc;

public class MmsHelloMonkey : TwilioController
{
    [HttpPost]
    public ActionResult Index(SmsRequest request)
    {
        var response = new TwilioResponse();
        response.Message("Hello, Mobile Monkey",
            new [] { "https://demo.twilio.com/owl.png" },
            null);
        return TwiML(response);
    }
}
