// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using Twilio.Rest.Api.V2010;
class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/console
    string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string AccountSidToActivate = "ACxxxxxxxxxxxxxxxxxxx";
    string authToken = "your_auth_token";

    TwilioClient.Init(accountSid, authToken);
    AccountResource account = AccountResource.Update(
      sid: AccountSidToActivate,
      status: AccountResource.StatusEnum.Active);
  }
}
