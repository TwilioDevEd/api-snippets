using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var connect = new Connect();
        connect.Room("DailyStandup");
        response.Append(connect);

        System.Console.WriteLine(response.ToString());
    }
}
