// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    string AuthToken = "{{ auth_token }}";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

	var tokenOptions = new TokenOptions()
	tokenOptions.Ttl = 3600
    var token = twilio.CreateToken(tokenOptions);

    Console.WriteLine(token.Username);
  }
}