// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACda6f132a3c49700934481addd5ce1659";
    string AuthToken = "{{ auth_token }}";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    var request = new MediaListRequest();
    request.DateCreatedComparison = ComparisonType.GreaterThanOrEqualTo;
    request.DateCreated = new DateTime(2013, 01, 01);
    var medias = twilio.ListMedia(request);
    
    foreach (var media in medias.Medias)
    {
      Console.WriteLine(media.ParentSid);
    }
  }
}