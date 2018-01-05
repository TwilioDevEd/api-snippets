// In Package Manager, run:
// Install-Package Twilio.AspNet.Mvc -DependencyVersion HighestMinor

using System.Collections.Generic;
using System.Web.Mvc;
using Twilio.AspNet.Mvc;
using Twilio.TwiML;

public class SmsController : TwilioController
{
    [HttpPost]
    public ActionResult Index()
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
            {"+14158675310", "Finn"},
            {"+14158675311", "Chewy"}
        };

        // if the sender is known, then greet them by name
        var name = "Friend";
        var from = Request.Form["From"];
        var to = Request.Form["To"];
        if (people.ContainsKey(from))
        {
            name = people[from];
        }

        var response = new MessagingResponse();
        response.Message($"{name} has messaged {to} {counter} times");

        return TwiML(response);
    }
}
