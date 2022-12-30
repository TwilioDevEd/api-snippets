using Microsoft.AspNetCore.Mvc;
using Twilio.TwiML;
using ValidateRequestExample.Filters;

namespace ValidateRequestExample.Controllers
{
    [Route("[controller]/[action]")]
    public class IncomingController : Controller
    {
        [ValidateTwilioRequest]
        public IActionResult Voice(string from)
        {
            var message = "Thanks for calling! " +
                          $"Your phone number is {from}. " +
                          "I got your call because of Twilio\'s webhook. " +
                          "Goodbye!";

            var response = new VoiceResponse();
            response.Say(string.Format(message, from));
            response.Hangup();

            return Content(response.ToString(), "text/xml");
        }

        [ValidateTwilioRequest]
        public IActionResult Message(string body)
        {
            var message = $"Your text to me was {body.Length} characters long. " +
                          "Webhooks are neat :)";

            var response = new MessagingResponse();
            response.Message(message);

            return Content(response.ToString(), "text/xml");
        }
    }
}