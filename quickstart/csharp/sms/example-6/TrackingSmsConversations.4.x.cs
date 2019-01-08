// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using System.Collections.Generic;
using System.Web.Mvc;
using Twilio.Mvc;
using Twilio.TwiML;
using Twilio.TwiML.Mvc;

public class TrackingSmsConversations : TwilioController
{
    [HttpPost]
    public ActionResult Index(SmsRequest request)
    {
        // get the session varible if it exists
        var counter = Session["counter"] != null ? (int) Session["counter"] : 0;

        // increment it
        counter++;

        // save it
        Session["counter"] = counter;

        // make an associative array of senders we know, indexed by phone number
        var people = new Dictionary<string, string>()
        {
            {"+14158675308", "Curious George"},
            {"+12349013030", "Boots"},
            {"+12348134522", "Virgil"}
        };

        // if the sender is known, then greet them by name
        var name = people.ContainsKey(Request.Form["From"])
            ? people[Request.Form["From"]]
            : "Monkey";

        var response = new TwilioResponse();
        response.Message($"{name} has messaged {request.To} {counter} times");
        return TwiML(response);
    }
}
