using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Gather();

        System.Console.WriteLine(response.ToString());
    }
}
