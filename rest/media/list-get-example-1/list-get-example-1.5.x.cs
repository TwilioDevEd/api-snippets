// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account.Message;
class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/console
    string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string authToken = "your_auth_token";
    TwilioClient.Init(accountSid, authToken);

    var medias = MediaResource.Read("MM800f449d0399ed014aae2bcc0cc2f2ec");

    foreach (var media in medias)
    {
      Console.WriteLine(media.ContentType);
    }
  }
}
