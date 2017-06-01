using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Hangup();

        System.Console.WriteLine(response.ToString());
    }
}
