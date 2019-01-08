// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using System.Collections.Generic;
using System.Web.Mvc;
using Twilio.Mvc;
using Twilio.TwiML;
using Twilio.TwiML.Mvc;

public class SmsController : TwilioController
{
    [HttpPost]
    public ActionResult Index(SmsRequest request)
    {
        var counter = 0;

        // get the session varible if it exists    
        if (Session["counter"] != null)
        {
            counter = (int) Session["counter"];
        }

        // increment it
        counter++;

        // save it
        Session["counter"] = counter;

        // make an associative array of senders we know, indexed by phone number
        var people = new Dictionary<string, string>()
        {
            {"+14158675308", "Rey"},
            {"+12349013030", "Finn"},
            {"+12348134522", "Chewy"}
        };

        // if the sender is known, then greet them by name
        var name = "Friend";
        if (people.ContainsKey(request.From))
        {
            name = people[request.From];
        }

        var response = new TwilioResponse();
        response.Message($"{name} has messaged {request.To} {counter} times");
        return TwiML(response);
    }
}