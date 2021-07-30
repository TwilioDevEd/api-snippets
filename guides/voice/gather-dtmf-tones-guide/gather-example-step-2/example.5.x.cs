// In Package Manager, run:
// Install-Package Twilio.AspNet.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.AspNet.Mvc;
using Twilio.AspNet.Common;
using Twilio.TwiML;
using System;

public class VoiceController : TwilioController
{
	[HttpPost]
	public TwiMLResult Index()
	{
		var response = new VoiceResponse();
		response.Gather(numDigits: 1, action: new Uri("/voice/gather", UriKind.Relative))
			    .Say("For sales, press 1. For support, press 2.");

		// If the user doesn't enter input, loop
		response.Redirect(new Uri("/voice", UriKind.Relative));

		return TwiML(response);
	}


	[HttpPost]
	public TwiMLResult Gather(VoiceRequest request)
	{
		var response = new VoiceResponse();

		// If the user entered digits, process their request
		if (!string.IsNullOrEmpty(request.Digits))
		{
			switch (request.Digits)
			{
				case "1":
					response.Say("You selected sales. Good for you!");
					break;
				case "2":
					response.Say("You need support. We will help!");
					break;
				default:
					response.Say("Sorry, I don't understand that choice.").Pause();
					response.Redirect(new Uri("/voice", UriKind.Relative));
					break;
			}
		}
		else
		{
			// If no input was sent, redirect to the /voice route
			response.Redirect(new Uri("/voice", UriKind.Relative));
		}

		return TwiML(response);
	}
}
