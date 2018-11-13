using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial(action: new Uri("handleLeaveConference.php",
            UriKind.Relative), method: Twilio.Http.HttpMethod.Post,
            hangupOnStar: true, timeLimit: 30);
        dial.Conference("LoveTwilio");
        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
