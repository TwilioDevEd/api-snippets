using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Conference("EventedConf",
            statusCallback: "https://myapp.com/events",
            statusCallbackEvent: "start end join leave mute hold");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}
