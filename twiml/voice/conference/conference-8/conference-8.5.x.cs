using Twilio.TwiML;


public class Conference8
{
    public static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Conference("Customer Waiting Room", beep: "false", endConferenceOnExit: "true");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}
