using Twilio.TwiML;
using Twilio.Http;
using System;

class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Our store is located at 123 Easy St.");
        response.Sms("Store Location: 123 Easy St.", action: new Uri("/smsHandler.php"),
            method: HttpMethod.Post);

        Console.WriteLine(response.ToString());;
    }
}
