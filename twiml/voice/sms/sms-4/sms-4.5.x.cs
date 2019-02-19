using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Our store is located at 123 Easy St.");
        response.Sms("Store Location: 123 Easy St.",
            statusCallback: new Uri("/smsHandler.php"));

        Console.WriteLine(response.ToString());
    }
}
