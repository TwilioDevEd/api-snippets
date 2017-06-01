// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Wireless.V1;
using Twilio.Http;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";

        TwilioClient.Init(accountSid, authToken);

        var sim = SimResource.Update("DEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
            callbackMethod: HttpMethod.Post,
            commandsCallbackUrl: new Uri("https://sim-manager.mycompany.com/sim-update-callback/AliceSmithSmartMeter"),
            status: SimResource.StatusEnum.Active);

        Console.WriteLine(sim.Sid);
    }
}
