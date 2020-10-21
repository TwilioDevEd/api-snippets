// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Chat.V2;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        const string serviceSid = Environment.GetEnvironmentVariable("TWILIO_SERVICE_SID");
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
