using Twilio.TwiML;
using Twilio.Http;
using Twilio.TwiML.Voice;
using System;

class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial(action: new Uri("handleLeaveConference.php"), method: HttpMethod.Post,
            hangupOnStar: true, timeLimit: 30);
        dial.Conference("LoveTwilio");
        response.Append(dial);

        Console.WriteLine(response.ToString());;
    }
}
