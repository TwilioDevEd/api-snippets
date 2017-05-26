using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Play("https://api.twilio.com/cowbell.mp3");

        System.Console.WriteLine(response.ToString());
    }
}
