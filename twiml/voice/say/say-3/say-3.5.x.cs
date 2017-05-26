using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Hej!", language: "sv-SE");

        System.Console.WriteLine(response.ToString());
    }
}
