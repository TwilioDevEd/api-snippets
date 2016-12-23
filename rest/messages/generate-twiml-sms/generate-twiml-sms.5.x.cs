// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.TwiML;

public class SmsController : Controller
{
    [HttpPost]
    public ActionResult Index()
    {
        var messagingResponse = new MessagingResponse();
        messagingResponse.Message("The Robots are coming! Head for the hills!");

        return Content(messagingResponse.ToString(), "text/xml");
    }
}
