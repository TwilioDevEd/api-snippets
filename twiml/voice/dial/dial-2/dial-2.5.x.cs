using Twilio.TwiML;


public class Dial2
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Dial("415-123-4567");
        response.Say("Goodbye");

        System.Console.WriteLine(response.ToString());
    }
}
