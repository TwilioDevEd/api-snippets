// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Notify.Service;

public class Example
{
    public static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        TwilioClient.Init(accountSid, authToken);

        var binding = BindingResource.Create(
            servicePathSid: serviceSid,
            identity: "00000001",
            bindingType: BindingResource.BindingTypeEnum.Apn,
            address: "device_token",
            tag: new List<string> { "preferred device", "new user" });

        Console.WriteLine(binding.Sid);
    }
}
