// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using System.Diagnostics;
using System.Web.Mvc;
using Twilio.Mvc;
using Twilio.TwiML.Mvc;

public class MessageStatusController : Controller
{
    [HttpPost]
    public ActionResult Index(SmsRequest request)
    {
        // Log the message id and status
        var logMessage = "\"" + request.SmsSid + "\", " +
                         "\"" + request.MessageStatus + "\"";
        Trace.WriteLine(logMessage);
        return Content("Handled");
    }
}