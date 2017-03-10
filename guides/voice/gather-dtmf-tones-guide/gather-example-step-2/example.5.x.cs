// In Package Manager, run:
// Install-Package Twilio.AspNet.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.AspNet.Mvc;
using Twilio.TwiML;

public class VoiceController : TwilioController
{
	[HttpPost]
	public ActionResult Index()
	{
		var response = new VoiceResponse();
		response.Gather(
			new Gather(numDigits: 1, action: "/voice/gather")
			    .Say("For sales, press 1. For support, press 2."));

		// If the user doesn't enter input, loop
		response.Redirect("/voice");

		return Content(response.ToString(), "text/xml");
	}


	[HttpPost]
	public ActionResult Gather(string digits)
	{
		var response = new VoiceResponse();

		// If the user entered digits, process their request
		if (!string.IsNullOrEmpty(digits))
		{
			switch (digits)
			{
				case "1":
					response.Say("You selected sales. Good for you!");
					break;
				case "2":
					response.Say("You need support. We will help!");
					break;
				default:
					response.Say("Sorry, I don't understand that choice.").Pause();
					response.Redirect("/voice");
					break;
			}
		}
		else
		{
			// If no input was sent, redirect to the /voice route
			response.Redirect("/voice");
		}

		return TwiML(response);
	}
}
