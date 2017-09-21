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
        var message = new Message();
        message.Body("Hello, Mobile Monkey");
        message.Media("https://demo.twilio.com/owl.png");

        var messagingResponse = new MessagingResponse();
        messagingResponse.Message(message);

        return TwiML(messagingResponse);
    }
}
