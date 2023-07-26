using Twilio;
using Twilio.Rest.Api.V2010.Account;

class Program
{
    static void Main(string[] args)
    {
        string accountSid = Environment.GetEnvironmentVariable("ACCOUNT_SID");
        string apiKeySid = Environment.GetEnvironmentVariable("API_KEY_SID");
        string apiKeySecret = Environment.GetEnvironmentVariable("API_KEY_SECRET");

        string toNumber = Environment.GetEnvironmentVariable("TO_NUMBER");
        string fromNumber = Environment.GetEnvironmentVariable("FROM_NUMBER");

        TwilioClient.Init(
            apiKeySid,
            apiKeySecret,
            accountSid=accountSid,
        );

        TwilioClient.SetRegion("ie1");
        TwilioClient.SetEdge("dublin");


        var call = CallResource.Create(
            twiml: new Twilio.Types.Twiml("<Response><Say>Ahoy from Ireland</Say></Response>"),
            to: new Twilio.Types.PhoneNumber(toNumber),
            from: new Twilio.Types.PhoneNumber(fromNumber)
        );
    }
}
