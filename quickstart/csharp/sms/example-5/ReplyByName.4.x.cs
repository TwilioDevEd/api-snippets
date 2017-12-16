// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.Mvc;
using Twilio.TwiML;
using Twilio.TwiML.Mvc;

public class ReplyByName : TwilioController
{
    [HttpPost]
    public ActionResult Index(SmsRequest request)
    {
        // make an associative array of people we know, indexed by phone number
        var people = new Dictionary<string, string>() {
            {"+14158675309", "Curious George"},
            {"+14158675310", "Boots"},
            {"+14158675311", "Virgil"}
        };

        var name = people.ContainsKey(Request.Form["From"])
            ? people[Request.Form["From"]]
            : "Monkey";

        var response = new TwilioResponse();
        response.Message($"{name}, thanks for the message!");

        return TwiML(response);
    }
}
