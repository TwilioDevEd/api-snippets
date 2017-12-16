// Get the C# helper library from https://twilio.com/docs/libraries/csharp
using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Preview.DeployedDevices.DeploymentResource;

public class Example
{
    public static void Main(string[] args)
    {
        // Get your Account SID and Auth Token from https://twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        var deploymentSid = 'DLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
        var deploymentDeleted = DeploymentResource.Delete(deploymentSid);

        Console.WriteLine(deploymentDeleted);
    }
}
