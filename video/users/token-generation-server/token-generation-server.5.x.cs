using System.Collections.Generic;
using System.Web.Mvc;
using System.Configuration;
using Twilio.Jwt.AccessToken;

namespace VideoAccessTokenServer.Controllers
{
    public class TokenController : Controller
    {
        // GET: Token
        public ActionResult Index()
        {
            // Load Twilio configuration from Web.config
            var accountSid = ConfigurationManager.AppSettings["TwilioAccountSid"];
            var apiKey = ConfigurationManager.AppSettings["TwilioApiKey"];
            var apiSecret = ConfigurationManager.AppSettings["TwilioApiSecret"];

            // Create a random identity for the client
            var identity = Request.QueryString["identity"] ?? "identity";

            // Create a video grant for the token
            var grant = new VideoGrant();
            grant.Room = Request.QueryString["room"];
            var grants = new HashSet<IGrant> { grant };

            // Create an Access Token generator
            var token = new Token(accountSid, apiKey, apiSecret, identity: identity, grants: grants);

            return Json(new
            {
                token = token.ToJwt()
            }, JsonRequestBehavior.AllowGet);
        }
    }
}