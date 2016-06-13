// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "{{ account_sid }}";
    string AuthToken = "{{ auth_token }}";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    var feedbackSummary = twilio.GetFeedbackSummary("FSa346467ca321c71dbd5e12f627deb854");

    Console.WriteLine(feedbackSummary.DateCreated);
  }
}
