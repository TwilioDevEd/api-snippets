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

    const string body = "McAvoy or Stewart? These timelines can get so confusing.";
    var statusCallback = new Uri("http://requestb.in/1234abcd");
    var message = MessageResource.Create(new PhoneNumber("+15017250604"),
                                         from: new PhoneNumber("+15558675309"),
                                         body: body,
                                         statusCallback: statusCallback);

    Console.WriteLine(message.Sid);
 }
}
