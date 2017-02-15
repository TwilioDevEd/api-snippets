// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Chat.V1.Service;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "accountSid";
        const string authToken = "authToken";
        const string serviceSid = "serviceSid";
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
