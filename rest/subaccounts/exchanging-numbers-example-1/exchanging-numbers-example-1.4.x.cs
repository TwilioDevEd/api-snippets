// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    var accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    var authToken = "your_auth_token";

    // In the case you want to transfer numbers between subaccounts, you need to 
    // know three things - the account SID of the phone number's current owner, 
    // the account SID of the account you'd like to transfer the number to, and 
    // the SID of the phone number you'd like to transfer
    var currentOwnerSid = "ACyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy";
    var newOwnerSid = "ACzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz";
    var phoneNumberSid = "PNyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy";

    // Create an authenticated REST client
    var twilio = new TwilioRestClient(accountSid, authToken, currentOwnerSid);

    var options = new PhoneNumberOptions();
    options.AccountSid = newOwnerSid;
    
    twilio.UpdateIncomingPhoneNumber(phoneNumberSid, options);
  }
}