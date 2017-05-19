using Twilio.TwiML;


public class Dial6
{
    public static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial(record: "record-from-ringing-dual", recordingStatusCallback: "www.myexample.com");
        dial.Conference("myteamroom");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}
