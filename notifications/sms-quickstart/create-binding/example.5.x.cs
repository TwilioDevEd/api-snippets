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

        var binding = BindingResource.Create(
                        serviceSid,
                        endpoint: "your_user@example.com:sms",
                        identity: "your_user@example.com",
                        bindingType: BindingResource.BindingTypeEnum.Sms,
                        address: "+1651555667777",
                        tag: new List<string> {
                          "rogue_one", "han_solo_spinoff"
                          });

        Console.WriteLine(binding.Sid);
    }
}
