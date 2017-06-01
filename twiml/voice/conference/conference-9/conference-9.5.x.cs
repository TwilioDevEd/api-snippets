using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial(action: "handleLeaveConference.php", method: "POST",
            hangupOnStar: true, timeLimit: 30);
        dial.Conference("LoveTwilio");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}
