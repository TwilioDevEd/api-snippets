// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;


class Program
{
    static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        // and set the environment variables. See http://twil.io/secure
        string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");

        TwilioClient.Init(accountSid, authToken);

        var message = MessageResource.Create(
            shortenUrls: true,
            messagingServiceSid: "MGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            body: "Visit this link to start earning rewards today! https://example.com/N6uAirXeREkpV2MW7kpV2MW7TAvh1zn4gEFMTAvh1zn4gEFMN6uAirXeRE",
            to: new Twilio.Types.PhoneNumber("whatsapp:+15551212121")
        );

        Console.WriteLine(message.Sid);
    }
}
