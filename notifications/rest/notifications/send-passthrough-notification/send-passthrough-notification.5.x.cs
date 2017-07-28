// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Notify.V1.Service;

public class Example
{
    public static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        TwilioClient.Init(accountSid, authToken);

        var notification = NotificationResource.Create(
            serviceSid,
            toBinding: new List<string> { "{\"binding_type\":\"sms\",\"address\":\"+15555555555\"}",
            "{\"binding_type\":\"facebook-messenger\",\"address\":\"123456789123\"}" },
            body: "Hello Bob");

        Console.WriteLine(notification.Sid);
    }
}
