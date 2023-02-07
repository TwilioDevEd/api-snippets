// Get the C# helper library from https://twilio.com/docs/libraries/csharp
using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Preview.DeployedDevices;

public class Example
{
    public static void Main(string[] args)
    {
        // Get your Account SID and Auth Token from https://twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        TwilioClient.Init(accountSid, authToken);

        var deployments = DeploymentResource.Read();

        foreach (var deployment in deployments)
        {
            Console.WriteLine(deployment.Sid);
        }
    }
}
