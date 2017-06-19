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
            identity: new List<string> { "00000001" },
            title: "Generic loooooooong title for all Bindings",
            body: "This is the body for all Bindings",
            data: "{\"custom_key1\":\"custom value 1\"," + 
                  "\"custom_key2\":\"custom value 2\"}",
            fcm: "{\"notification\":{\"title\":\"New alert\"," +
                  "\"body\" : \"Hello Bob!\"}}",
            apn: "{\"aps\" : " +
                   "{ \"alert\": " +
                       "{\"title\":\"New alert\"," +
                        "\"body\" : \"Hello Bob!\"}");

        Console.WriteLine(notification.Sid);
    }
}
