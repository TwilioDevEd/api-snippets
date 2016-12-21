// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/console
    string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string authToken = "your_auth_token";
    TwilioClient.Init(accountSid, authToken);

    var status = ConferenceResource.StatusEnum.Completed;
    var dateCreated = new DateTime(2009, 07, 06);
    var conferences = ConferenceResource.Read(status: status,
                                              dateCreated: dateCreated);

    foreach (var conference in conferences)
    {
      Console.WriteLine(conference.Status);
    }
  }
}
