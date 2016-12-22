// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/console
    const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    const string authToken = "your_auth_token";
    TwilioClient.Init(accountSid, authToken);

    var url = new Uri("http://demo.twilio.com/sipdial.xml");
    var to = new PhoneNumber("sip:kate@example.com");
    var from = new PhoneNumber("Jack");
    const string sipAuthPassword = "secret";
    const string sipAuthUsername = "jack";

    var call = CallResource.Create(to,
                                   from,
                                   url: url,
                                   sipAuthUsername: sipAuthUsername,
                                   sipAuthPassword: sipAuthPassword);

    Console.WriteLine(call.Sid);
  }
}
