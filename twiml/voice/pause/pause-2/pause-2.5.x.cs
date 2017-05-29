using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Pause(length: 5);
        response.Say("Hi there.");

        System.Console.WriteLine(response.ToString());
    }
}
