using Twilio.TwiML;


public class Client3
{
    public static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Client("jenny",
             statusCallbackEvent: "initiated ringing answered completed",
             statusCallback: "https://myapp.com/calls/events",
             statusCallbackMethod: "POST");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}
