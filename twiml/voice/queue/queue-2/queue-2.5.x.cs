using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("You will now be connected to an agent.");

        System.Console.WriteLine(response.ToString());
    }
}
