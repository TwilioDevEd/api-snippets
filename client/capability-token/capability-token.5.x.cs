// In Package Manager, run:
// Install-Package Twilio -Pre
using System;
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
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");

        // Put your Twilio Application SID here
        const string appSid = Environment.GetEnvironmentVariable("TWILIO_APP_SID");

        var scopes = new HashSet<IScope>
        {
            new OutgoingClientScope(appSid),
            new IncomingClientScope("joey")
        };
        var capability = new ClientCapability(accountSid, authToken, scopes: scopes);

        return Content(capability.ToJwt(), "application/jwt");
    }
}
