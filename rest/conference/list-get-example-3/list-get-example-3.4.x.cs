// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string AuthToken = "your_auth_token";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    var request = new ConferenceListRequest();
    request.Status = "completed";
    request.DateCreated = new DateTime(2009, 07, 06);
    var conferences = twilio.ListConferences(request);
    
    foreach (var conference in conferences.Conferences)
    {
      Console.WriteLine(conference.Status);
    }
  }
}