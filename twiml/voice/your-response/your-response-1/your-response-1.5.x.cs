using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Hello World");
        response.Play("https://api.twilio.com/Cowbell.mp3");

        System.Console.WriteLine(response.ToString());
    }
}
