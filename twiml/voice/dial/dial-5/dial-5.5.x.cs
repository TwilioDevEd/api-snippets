using Twilio.TwiML;


public class Dial5
{
    public static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial(record: "record-from-ringing-dual", recordingStatusCallback: "www.myexample.com");
        dial.Number("+15558675309");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}