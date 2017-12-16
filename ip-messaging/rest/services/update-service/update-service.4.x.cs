// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio.IpMessaging;
using Twilio.IpMessaging.Model;
using System.Collections.Generic;

class Example {
    static void Main (string[] args) {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string friendlyName = "friendlyName";
        const string defaultServiceRoleSid = "defaultServiceRoleSid";
        const string defaultChannelRoleSid = "defaultChannelRoleSid";
        const string defaultChannelCreatorRoleSid = "defaultChannelCreatorRoleSid";
        const int typingIndicatorTimeout = 5;
        Dictionary<string, string> webhooksParams = new Dictionary<string, string>();

        // Update a service
        var client = new IpMessagingClient(accountSid, authToken);
        Service service = client.UpdateService(serviceSid,
            friendlyName,
            defaultServiceRoleSid,
            defaultChannelRoleSid,
            defaultChannelCreatorRoleSid,
            typingIndicatorTimeout,
            webhooksParams);

        Console.WriteLine(service);
    }
}
