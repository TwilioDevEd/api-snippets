using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Conference("Room 1234");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}
