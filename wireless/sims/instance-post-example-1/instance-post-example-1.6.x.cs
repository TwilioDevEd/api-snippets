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
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");

        TwilioClient.Init(accountSid, authToken);

        var sim = SimResource.Update("DEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
            callbackMethod: HttpMethod.Post,
            commandsCallbackUrl: new Uri("https://sim-manager.mycompany.com/sim-update-callback/AliceSmithSmartMeter"),
            status: SimResource.StatusEnum.Active);

        Console.WriteLine(sim.Sid);
    }
}
