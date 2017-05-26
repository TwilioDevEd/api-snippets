using Twilio.TwiML;


public class Say2
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Chapeau!", voice: "alice", language: "fr-FR");

        System.Console.WriteLine(response.ToString());
    }
}
