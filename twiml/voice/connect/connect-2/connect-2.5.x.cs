using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var connect = new Connect();
        connect.Room("DailyStandup", participantIdentity: "alice");
        response.Append(connect);

        Console.WriteLine(response.ToString());
    }
}
