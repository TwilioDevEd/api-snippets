using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var connect = new Connect(action: "https://myactionurl.com/");
        connect.Room("meeting", statusCallback: "https://myactionurl.com/");
        response.Append(connect);

        System.Console.WriteLine(response.ToString());
    }
}
