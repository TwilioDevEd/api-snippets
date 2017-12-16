// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Chat.V2.Service;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string friendlyName = "roleName";

        TwilioClient.Init(accountSid, authToken);

        // Create a role
        var permissions = new List<string>
        {
            "createChannel",
            "joinChannel"
        };

        var role = RoleResource.Create(serviceSid,
                                       friendlyName,
                                       RoleResource.RoleTypeEnum.Deployment,
                                       permissions);

        Console.WriteLine(role.Sid);
    }
}
