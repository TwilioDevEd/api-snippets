// In Package Manager, run:
// Install-Package Twilio.AspNet.Mvc -DependencyVersion HighestMinor

using System.Collections.Generic;
using System.Web.Mvc;
using Twilio.AspNet.Mvc;
using Twilio.TwiML;

public class TrackingSmsConversations : TwilioController
{
    [HttpPost]
    public ActionResult Index()
    {
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
        var to = Request.Form["To"];

        var response = new MessagingResponse();
        response.Message($"{name} has messaged {to} {counter} times");

        return TwiML(response);
    }
}
