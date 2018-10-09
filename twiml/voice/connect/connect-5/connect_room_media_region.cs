using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var connect = new Connect(action: "https://myactionurl.com/", timeout: "5");
        connect.Room("meeting", statusCallback: "https://myactionurl.com/", mediaRegion: "ie1");
        response.Append(connect);

        System.Console.WriteLine(response.ToString());
    }
}
