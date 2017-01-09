// In Package Manager, run:
// Install-Package Twilio.Client -Pre

using System.Web.Mvc;
using Twilio.JWT;

public class TokenController : Controller
{
    // GET: Token
    public ActionResult Index()
    {
        // put your Twilio API credentials here
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";

        // put your Twilio Application SID here
        const string appSid = "APXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        var capability = new TwilioCapability(accountSid, authToken);
        capability.AllowClientOutgoing(appSid);
        capability.AllowClientIncoming(Request["ClientName"]);
        var token = capability.GenerateToken();

        return Content(token, "application/jwt");
    }
}
