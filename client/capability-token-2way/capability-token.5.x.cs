// In Package Manager, run:
// Install-Package Twilio.Client -Pre

using System.Collections.Generic;
using System.Web.Mvc;
using Twilio.Jwt;
using Twilio.Jwt.Client;

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

        var scopes = new HashSet<IScope>
        {
            new OutgoingClientScope(appSid),
            new IncomingClientScope(Request["ClientName"])
        };
        var capability = new ClientCapability(accountSid, authToken, scopes: scopes);

        return Content(capability.ToJwt(), "application/jwt");
    }
}
