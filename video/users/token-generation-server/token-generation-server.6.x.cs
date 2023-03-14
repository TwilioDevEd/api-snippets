using System.Collections.Generic;
using System.Configuration;
using System.Web.Mvc;
using Faker;
using Twilio.Jwt.AccessToken;

namespace VideoQuickstart.Controllers
{
    public class TokenController : Controller
    {
        // GET: Token
        public ActionResult Index(string device)
        {
            // Load Twilio configuration from Web.config
            var accountSid = ConfigurationManager.AppSettings["TwilioAccountSid"];
            var apiKey = ConfigurationManager.AppSettings["TwilioApiKey"];
            var apiSecret = ConfigurationManager.AppSettings["TwilioApiSecret"];
            var videoConfigSid = ConfigurationManager.AppSettings["TwilioConfigurationSid"];

            // Create a random identity for the client
            var identity = Internet.UserName();

            var grants = new HashSet<IGrant>
            {
                // Grant access to Video
                new VideoGrant { ConfigurationProfileSid = videoConfigSid }
            };

            // Create an Access Token generator
            var token = new Token(accountSid, apiKey, apiSecret, identity: identity, grants: grants);

            return Json(new
            {
                identity,
                token = token.ToJwt()
            }, JsonRequestBehavior.AllowGet);
        }
    }
}
