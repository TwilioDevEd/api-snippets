// In Package Manager, run:
// Install-Package Twilio -Pre
using System.Collections.Generic;
using System.Web.Mvc;
using Twilio.Jwt;
using Twilio.Jwt.Client;

public class TokenController : Controller
{
    // GET: Token
    public ActionResult Index()
    {
        // Put your Twilio API credentials here
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";

        // Put your Twilio Application SID here
        const string appSid = "APXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        var scopes = new HashSet<IScope>
        {
            new OutgoingClientScope(appSid),
            new IncomingClientScope("jenny")
        };
        var capability = new ClientCapability(accountSid, authToken, scopes: scopes);

        return Content(capability.ToJwt(), "application/jwt");
    }
}
