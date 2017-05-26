using Twilio.TwiML;


public class Say3
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Hej!", language: "sv-SE");

        System.Console.WriteLine(response.ToString());
    }
}
