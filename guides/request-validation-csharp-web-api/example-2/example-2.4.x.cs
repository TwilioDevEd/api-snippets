using System.Net.Http;
using System.Text;
using System.Web.Http;
using Twilio.TwiML;
using ValidateRequestExample.Filters;

namespace ValidateRequestExample.Controllers
{
    public class TwilioMessagingRequest
    {
        public string Body { get; set; }
    }

    public class TwilioVoiceRequest
    {
        public string From { get; set; }
    }

    public class IncomingController : ApiController
    {
        [Route("voice")]
        [AcceptVerbs("POST")]
        [ValidateTwilioRequest]
        public HttpResponseMessage PostVoice([FromBody] TwilioVoiceRequest voiceRequest)
        {
            var message =
                "Thanks for calling! " +
                $"Your phone number is {voiceRequest.From}. " +
                "I got your call because of Twilio's webhook. " +
                "Goodbye!";

            var response = new VoiceResponse();
            response.Say(message);
            response.Hangup();

            return ToResponseMessage(response.ToString());
        }

        [Route("message")]
        [AcceptVerbs("POST")]
        [ValidateTwilioRequest]
        public HttpResponseMessage PostMessage([FromBody] TwilioMessagingRequest messagingRequest)
        {
            var message =
                $"Your text to me was {messagingRequest.Body.Length} characters long. " +
                "Webhooks are neat :)";

            var response = new MessagingResponse();
            response.Message(new Message(message));

            return ToResponseMessage(response.ToString());
        }

        private static HttpResponseMessage ToResponseMessage(string response)
        {
            return new HttpResponseMessage
            {
                Content = new StringContent(response, Encoding.UTF8, "application/xml")
            };
        }
    }
}
