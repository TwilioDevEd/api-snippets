// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Chat.V2;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "accountSid";
        const string authToken = "authToken";
        const string serviceSid = "serviceSid";
        const string friendlyName = "friendlyName";
        const string defaultServiceRoleSid = "defaultServiceRoleSid";
        const string defaultChannelRoleSid = "defaultChannelRoleSid";
        const string defaultChannelCreatorRoleSid = "defaultChannelCreatorRoleSid";
        const int typingIndicatorTimeout = 5;

        TwilioClient.Init(accountSid, authToken);

        var service = ServiceResource.Update(serviceSid,
                                             friendlyName,
                                             defaultServiceRoleSid,
                                             defaultChannelRoleSid,
                                             defaultChannelCreatorRoleSid,
                                             typingIndicatorTimeout: typingIndicatorTimeout);

        Console.WriteLine(service.FriendlyName);
    }
}
