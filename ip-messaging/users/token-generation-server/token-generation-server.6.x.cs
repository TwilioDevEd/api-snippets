using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web;
using System.Web.Mvc;
using Twilio;
using Twilio.Auth;
using Twilio.Jwt.AccessToken;
using Faker;

namespace TwilioIpMessaging.Controllers
{
    public class TokenController : Controller
    {
        // GET: /token
        public ActionResult Index(string device)
        {
            // Load Twilio configuration from Web.config
            var accountSid = ConfigurationManager.AppSettings["TwilioAccountSid"];
            var apiKey = ConfigurationManager.AppSettings["TwilioApiKey"];
            var apiSecret = ConfigurationManager.AppSettings["TwilioApiSecret"];
            var chatServiceSid = ConfigurationManager.AppSettings["TwilioChatServiceSid"];

            // Create a random identity for the client
            var identity = Internet.UserName();

            // Create an Chat grant for this token
            var grants = new HashSet<IGrant>
            {
                new ChatGrant
                {
                    EndpointId = $"TwilioChatDemo:{identity}:{device}",
                    ServiceSid = chatServiceSid
                }
            };

            // Create an Access Token generator
            var token = new Token(
                accountSid,
                apiKey,
                apiSecret,
                identity,
                grants: grants
            );

            return Json(new {
                identity = identity,
                token = token.ToJwt()
            }, JsonRequestBehavior.AllowGet);
        }
    }
}
