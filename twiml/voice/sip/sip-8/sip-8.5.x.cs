using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Sip("sip:kate@example.com?mycustomheader=foo&smyotherheader=bar");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}
