// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example
{
 static void Main(string[] args)
 {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "{{#accountSid}}{{accountSid}}{{/accountSid}}";
    string AuthToken = "{{#authToken}}{{authToken}}{{/authToken}}";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    var message = twilio.SendMessage(
        "{{#fromPhoneNumber}}{{fromPhoneNumber}}{{/fromPhoneNumber}}", "{{#toPhoneNumber}}{{toPhoneNumber}}{{/toPhoneNumber}}",
        "{{#messageBody}}{{messageBody}}{{/messageBody}}",
        new string[] { "{{#messageMediaUrl}}{{messageMediaUrl}}{{/messageMediaUrl}}" }
    );
    Console.WriteLine(message.Sid);
 }
}
