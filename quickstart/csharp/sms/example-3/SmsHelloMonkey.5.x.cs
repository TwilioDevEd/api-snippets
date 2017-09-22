// In Package Manager, run:
// Install-Package Twilio.AspNet.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.AspNet.Mvc;
using Twilio.TwiML;

public class SmsHelloMonkey : TwilioController
{
    [HttpPost]
    public ActionResult Index()
    {
        var messagingResponse = new MessagingResponse();
        messagingResponse.Message("Hello, Mobile Monkey");

        return TwiML(messagingResponse);
    }
}
