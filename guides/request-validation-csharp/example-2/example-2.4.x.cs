using System;
using System.Configuration;
using System.Web;
using System.Web.Mvc;
using Twilio.TwiML;
using Twilio.TwiML.Mvc;

namespace helloworldcsharp.Controllers
{
	public class IncomingController : Controller
	{
		[RequestValidatorFilter]
		public ActionResult Voice (string From)
		{
			var response = new TwilioResponse();
			var message = @"
				Thanks for calling!

    			Your phone number is {0}. I got your call because of Twilio's webhook.

    			Goodbye!
			";
			response.Say(string.Format(message, From));
			response.Hangup();

			return new TwiMLResult(response);
		}

		[RequestValidatorFilter]
		public ActionResult Message (string Body)
		{
			var response = new TwilioResponse();
			var message = "Your text to me was {0} characters long. Webhooks are neat :)";

			response.Say(string.Format(message, Body.Length));
			response.Hangup();

			return new TwiMLResult(response);
		}
	}
}
