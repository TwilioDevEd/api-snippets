using System.Configuration;
using System.Web.Mvc;
using Faker;
using Twilio.JWT;

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

            // Create a random identity for the client
            var identity = Internet.UserName();

            // Create an Access Token generator
            var token = new AccessToken(accountSid, apiKey, apiSecret)
            {
                Identity = identity
            };

            // Create a video grant for this token
            var grant = new VideoGrant();
            token.AddGrant(grant);

            return Json(new
            {
                identity,
                token = token.ToJwt()
            }, JsonRequestBehavior.AllowGet);
        }
    }
}
