using System.Web.Mvc;
using Twilio.AspNet.Mvc;
using Twilio.TwiML;
using ValidateRequestExample.Filters;

namespace ValidateRequestExample.Controllers
{
    public class IncomingController : TwilioController
    {
        [ValidateTwilioRequest]
        public ActionResult Voice(string from)
        {
            var message = "Thanks for calling! " +
                $"Your phone number is {from}. " +
                "I got your call because of Twilio's webhook. " +
                "Goodbye!";

            var response = new VoiceResponse();
            response.Say(string.Format(message, from));
            response.Hangup();

            return TwiML(response);
        }

        [ValidateTwilioRequest]
        public ActionResult Message(string body)
        {
            var message = $"Your text to me was {body.Length} characters long. " +
                "Webhooks are neat :)";

            var response = new MessagingResponse();
            response.Message(new Message(message));

            return TwiML(response);
        }
    }
}
