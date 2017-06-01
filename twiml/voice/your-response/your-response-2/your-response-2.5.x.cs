using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Hello");

        System.Console.WriteLine(response.ToString());
    }
}
