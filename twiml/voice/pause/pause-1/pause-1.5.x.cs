using Twilio.TwiML;


public class Pause1
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Say("I will pause 10 seconds starting now!");
        response.Pause(length: 10);
        response.Say("I just paused 10 seconds");

        System.Console.WriteLine(response.ToString());
    }
}
