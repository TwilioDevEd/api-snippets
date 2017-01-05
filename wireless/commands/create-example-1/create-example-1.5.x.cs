// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Preview.Wireless;

public class Example
{
    public static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        var accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        var authToken = "your_auth_token";

        TwilioClient.Init(accountSid, authToken);

        var command = CommandResource.Create(
            "524116518656369", // Device SID or Alias
            "wakeup",          // Command text
            "https://devicemanager.mycompany.com/devices/524116518656369/commands");

        Console.WriteLine(command.Sid);
    }
}
