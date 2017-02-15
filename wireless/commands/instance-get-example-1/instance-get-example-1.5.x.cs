// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Preview.Wireless;

public class Example
{
    public static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string commandSid = "DCcb6aa7c620874dd98ba6c9c4108d0ed0";

        TwilioClient.Init(accountSid, authToken);

        var command = CommandResource.Fetch(commandSid);

        Console.WriteLine(command.Command);
    }
}
