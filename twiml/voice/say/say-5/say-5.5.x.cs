using Twilio.TwiML;


public class Say5
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Bom dia.", voice: "alice", language: "pt-BR", loop: 2);

        System.Console.WriteLine(response.ToString());
    }
}
