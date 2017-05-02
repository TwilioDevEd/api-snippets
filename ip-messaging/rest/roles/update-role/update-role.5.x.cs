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
        const string accountSid = "accountSid";
        const string authToken = "authToken";
        const string serviceSid = "serviceSid";
        const string roleSid = "roleSid";

        TwilioClient.Init(accountSid, authToken);

        // Update the role
        var permissions = new List<string>
        {
            "sendMessage",
            "leaveChannel"
        };

        var role = RoleResource.Update(serviceSid, roleSid, permissions);

        foreach (var permission in role.Permissions)
        {
            Console.WriteLine(permission);
        }
    }
}
