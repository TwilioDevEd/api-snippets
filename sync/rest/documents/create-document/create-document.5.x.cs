// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Sync.V1.Service;

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

        var data = new
        {
            DateUpdated = DateTime.UtcNow,
            MovieTitle = "On The Line",
            ShowTimes = new[] { "12:30:00Z", "14:45:00Z", "15:30:00Z", "17:45:00Z", "20:30:00Z" },
            Starring = new[] { "Lance Bass", "Joey Fatone" },
            Genre = "Romance"
        };

        var doc = DocumentResource.Create(serviceSid,
                                          "MyFirstDocument",
                                          data,
                                          1814400); // expires in 21 days

        Console.WriteLine(doc.Sid);
    }
}
