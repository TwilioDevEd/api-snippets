// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.AspNet.Mvc;
using Twilio.TwiML;

public class SendSmsDuringCall : TwilioController
{
    [HttpPost]
    public ActionResult Index()
    {
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

        var voiceResponse = new VoiceResponse();
        voiceResponse.Say($"Hello! {name}");
        voiceResponse.Sms($"{name}, thanks for the call!");

        return TwiML(voiceResponse);
    }
}
