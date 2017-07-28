// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Wireless.V1;


class Example
{
    static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";

        TwilioClient.Init(accountSid, authToken);
        var command = CommandResource.Create(
            new CreateCommandOptions {
                Command = "SGVsbG8sIE1hY2hpbmUh==",
                CommandMode = CommandModeEnum.Binary,
                CallbackUrl = new Uri("https://sim-manager.mycompany.com/commands/mobile-terminated-command-callback"))
            });

        Console.WriteLine(command.Sid);
    }
}
