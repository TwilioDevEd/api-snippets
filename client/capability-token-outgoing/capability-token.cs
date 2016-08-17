// In Package Manager, run:
// Install-Package Twilio.Client -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio;

public class TokenController : Controller
{
  // GET: Token
  public ActionResult Index()
  {
    // put your Twilio API credentials here
    string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string authToken = "your_auth_token";

    // put your Twilio Application Sid here
    string appSid = "APXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    var capability = new TwilioCapability(accountSid, authToken);
    capability.AllowClientOutgoing(appSid);
    string token = capability.GenerateToken();

    return Content(token, "application/jwt");
  }
}
