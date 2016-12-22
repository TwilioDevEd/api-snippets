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
    string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string authToken = "your_auth_token";
    TwilioClient.Init(accountSid, authToken);

    var url = new Uri("http://demo.twilio.com/sipdial.xml");
    var to = new PhoneNumber("sip:kate@example.com");
    var from = new PhoneNumber("Jack");
    var sipAuthPassword = "secret";
    var sipAuthUsername = "jack";

    var call = CallResource.Create(to,
                                   from,
                                   url: url,
                                   sipAuthUsername: sipAuthUsername,
                                   sipAuthPassword: sipAuthPassword);

    Console.WriteLine(call.Sid);
  }
}
