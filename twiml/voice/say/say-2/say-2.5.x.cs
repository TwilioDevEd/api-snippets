using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Chapeau!", voice: "alice", language: "fr-FR");

        System.Console.WriteLine(response.ToString());
    }
}
