using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Chapeau!", voice: "woman", language: "fr");

        System.Console.WriteLine(response.ToString());
    }
}
