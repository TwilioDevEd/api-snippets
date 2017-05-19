using Twilio.TwiML;


public class Pause-2.5.x
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Pause(length: 5);
        response.Say("Hi there.");

        System.Console.WriteLine(response.ToString());
    }
}
