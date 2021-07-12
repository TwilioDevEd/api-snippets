using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        var client = new Client();
        client.Identity("user_jane");
        client.Parameter(name: "FirstName", value: "Jane");
        client.Parameter(name: "LastName", value: "Doe");
        dial.Append(client);
        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
