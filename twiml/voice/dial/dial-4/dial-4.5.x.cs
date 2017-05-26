using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial(callerId: "+15551112222");
        dial.Number("+15558675309");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}
