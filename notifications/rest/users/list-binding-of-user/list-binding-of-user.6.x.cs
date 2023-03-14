// Download the twilio-csharp library from www.twilio.com/docs/libraries/csharp#installation
using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Notify.V1.Service.User;

public class Example
{
    public static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");

        const string serviceSid = Environment.GetEnvironmentVariable("TWILIO_SERVICE_SID");
        const string userBindingSid = "User0001";

        TwilioClient.Init(accountSid, authToken);

        var userBindings = UserBindingResource.Read(serviceSid, userBindingSid);

        foreach (var userBinding in userBindings)
        {
            Console.WriteLine(userBinding.Sid);
        }
    }
}
