// In Package Manager, run:
// Install-Package Twilio.AspNet.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.AspNet.Mvc;
using Twilio.TwiML;

public class SmsController : TwilioController
{
    [HttpPost]
    public ActionResult Index()
    {
        var messagingResponse = new MessagingResponse();
        messagingResponse.Message("The Robots are coming! Head for the hills!");

        return TwiML(messagingResponse);
    }
}
