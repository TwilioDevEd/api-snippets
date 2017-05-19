using Twilio.TwiML;


public class Pause2
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Pause(length: 5);
        response.Say("Hi there.");

        System.Console.WriteLine(response.ToString());
    }
}
