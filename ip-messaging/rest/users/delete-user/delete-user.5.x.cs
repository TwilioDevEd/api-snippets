// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
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
        const string userSid = "userSid";

        TwilioClient.Init(accountSid, authToken);

        // Delete a user
        var status = UserResource.Delete(serviceSid, userSid);

        Console.WriteLine(status);
    }
}
