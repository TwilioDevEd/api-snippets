// In Package Manager, run:
// Install-Package Twilio.Mvc -Pre

using System.Web.Mvc;
using Twilio.AspNet.Mvc;
using Twilio.TwiML;

public class VoiceController : TwilioController
{
	[HttpPost]
	public ActionResult Index(string digits)
	{
		var response = new VoiceResponse();

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
					RenderMainMenu(response);
					break;
			}
		}
		else
		{
			// If no input was sent, use the <Gather> verb to collect user input
			RenderMainMenu(response);
		}

		return TwiML(response);
	}

	private static void RenderMainMenu(VoiceResponse response)
	{
		response.Gather(
			new Gather(numDigits: 1)
			.Say("For sales, press 1. For support, press 2."));

		// If the user doesn't enter input, loop
		response.Redirect("/voice");
	}
}
