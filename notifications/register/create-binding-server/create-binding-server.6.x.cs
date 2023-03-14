// Download the twilio-csharp library from www.twilio.com/docs/libraries/csharp#installation
using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Notify.V1.Service;

public class Example
{
    public static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");

        const string serviceSid = Environment.GetEnvironmentVariable("TWILIO_SERVICE_SID");

        TwilioClient.Init(accountSid, authToken);

        var binding = BindingResource.Create(
            serviceSid,
            endpoint: "endpoint_id",
            identity: "00000001",
            bindingType: BindingResource.BindingTypeEnum.Gcm,
            address: "gcm_device_token",
            tag: new List<string> { "premium", "new user" });

        Console.WriteLine(binding.Sid);
    }
}
