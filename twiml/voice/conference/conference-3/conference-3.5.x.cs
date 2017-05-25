using Twilio.TwiML;


public class Conference3
{
    public static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Conference("moderated-conference-room",
             startConferenceOnEnter: "true", endConferenceOnExit: "true");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}
