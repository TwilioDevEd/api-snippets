// In Package Manager, run:
// Install-Package Twilio.AspNet.Mvc -DependencyVersion HighestMinor


using System.Text.RegularExpressions;
using System.Web.Mvc;
using Twilio.TwiML;

public class TokenController : Controller
{
    [HttpPost]
    public ActionResult Index(VoiceRequest request)
    {
        var response = new VoiceResponse();

        if (!string.IsNullOrEmpty(request.To))
        {
            var callerId = "+15017122661";

            // wrap the phone number or client name in the appropriate TwiML verb
            // by checking if the number given has only digits and format symbols
            if (Regex.IsMatch(request.To, "^[\\d\\+\\-\\(\\) ]+$"))
            {
                var number = new Dial(callerId: callerId);
                number.Number(Request.To);

                response.Dial(number);
            }
            else
            {
                var number = new Dial(callerId: callerId);
                number.Client(Request.To);

                response.Dial(number);
            }
        }
        else
        {
            response.Say("Thanks for calling!");
        }

        return Content(response.ToString(), "text/xml");
    }
}
