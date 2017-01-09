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
            var videoConfigSid = ConfigurationManager.AppSettings["TwilioConfigurationSid"];

            // Create a random identity for the client
            var identity = Internet.UserName();

            // Create an Access Token generator
            var token = new AccessToken(accountSid, apiKey, apiSecret)
            {
                Identity = identity
            };

            // Grant access to Video
            var grant = new VideoGrant
            {
                ConfigurationProfileSid = videoConfigSid
            };
            token.AddGrant(grant);

            return Json(new
            {
                identity,
                token = token.ToJwt()
            }, JsonRequestBehavior.AllowGet);
        }
    }
}
