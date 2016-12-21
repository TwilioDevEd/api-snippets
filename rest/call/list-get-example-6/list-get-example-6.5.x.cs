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

    var status = CallResource.StatusEnum.Busy;
    var to = new PhoneNumber("+15558675309");
    var calls = CallResource.Read(status: status,
                                  to: to);

    foreach (var call in calls)
    {
      Console.WriteLine(call.StartTime);
    }
  }
}
