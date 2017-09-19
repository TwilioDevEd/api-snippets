// Get the Node helper library from https://twilio.com/docs/libraries/csharp
using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Preview.DeployedDevices.Fleet

public class Example
{
    public static void Main(string[] args)
    {
        // Get your Account SID and Auth Token from https://twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        const string certificatePath = @"C:\path\to\certificate.pem";
        var certificate = CertificateResource.Create(
            pathFleetSid: "FLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            deviceSid: "THXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            friendlyName: "Woody",
            certificateData: System.IO.File.ReadAllText(certificatePath)
        );

        Console.WriteLine(certificate.Sid);
    }
}
