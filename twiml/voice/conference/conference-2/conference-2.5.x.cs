using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Conference("moderated-conference-room",
            startConferenceOnEnter: "false");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}
