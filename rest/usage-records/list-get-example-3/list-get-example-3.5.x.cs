// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account.Usage;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/console
    const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    const string authToken = "your_auth_token";
    TwilioClient.Init(accountSid, authToken);

    var category = RecordResource.CategoryEnum.CallsInbound;
    var records = RecordResource.Read(category: category,
                                      startDate: new DateTime(2012, 09, 01),
                                      endDate: new DateTime(2012, 09, 30));

    foreach (var record in records)
    {
      Console.WriteLine(record.Price);
    }
  }
}
