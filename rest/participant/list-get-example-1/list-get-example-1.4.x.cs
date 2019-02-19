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

    var participants = twilio.ListConferenceParticipants("CFbbe4632a3c49700934481addd5ce1659", null, null, null);
    
    foreach (var participant in participants.Participants)
    {
      Console.WriteLine(participant.Muted);
    }
  }
}