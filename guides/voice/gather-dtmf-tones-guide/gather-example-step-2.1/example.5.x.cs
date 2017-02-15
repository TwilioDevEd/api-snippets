// In Package Manager, run:
// Install-Package Twilio.Mvc -Pre

using System.Web.Mvc;
using Twilio.TwiML;

public class VoiceController : Controller
{
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

		return Content(response.ToString(), "text/xml");
	}
}
