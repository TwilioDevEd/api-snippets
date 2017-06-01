using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Leave();

        System.Console.WriteLine(response.ToString());
    }
}
