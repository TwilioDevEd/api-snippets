using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Conference("NoMusicNoBeepRoom", beep: "false", waitUrl: "",
            startConferenceOnEnter: true, endConferenceOnExit: true);
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}
