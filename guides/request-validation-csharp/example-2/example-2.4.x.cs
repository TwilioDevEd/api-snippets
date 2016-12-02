using System.Web.Mvc;
using Twilio.TwiML;
using Twilio.TwiML.Mvc;
using ValidateRequestExample.Filters;

namespace ValidateRequestExample.Controllers
{
    public class IncomingController : TwilioController
    {
        [ValidateTwilioRequest]
        public ActionResult Voice(string from)
        {
            var response = new TwilioResponse();
            const string message = "Thanks for calling! " +
                "Your phone number is {0}. I got your call because of Twilio's webhook. " +
                "Goodbye!";

            response.Say(string.Format(message, from));
            response.Hangup();

            return TwiML(response);
        }

        [ValidateTwilioRequest]
        public ActionResult Message(string body)
        {
            var response = new TwilioResponse();

            response.Say($"Your text to me was {body.Length} characters long. Webhooks are neat :)");
            response.Hangup();

            return TwiML(response);
        }
    }
}
