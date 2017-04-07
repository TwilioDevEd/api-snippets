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
        message.Body("The Robots are coming! Head for the hills!");
        message.Media("https://farm8.staticflickr.com/7090/6941316406_80b4d6d50e_z_d.jpg");

        var messagingResponse = new MessagingResponse();
        messagingResponse.Message(message);

        return TwiML(messagingResponse);
    }
}
