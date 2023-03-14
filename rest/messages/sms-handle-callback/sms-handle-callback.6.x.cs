// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using System.Diagnostics;
using System.Web.Mvc;

public class MessageStatusController : Controller
{
    [HttpPost]
    public ActionResult Index()
    {
        // Log the message id and status
        var smsSid = Request.Form["MessageSid"];
        var messageStatus = Request.Form["MessageStatus"];
        var logMessage = $"\"{smsSid}\", \"{messageStatus}\"";

        Trace.WriteLine(logMessage);
        return Content("Handled");
    }
}
