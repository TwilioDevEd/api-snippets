// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string AuthToken = "{{ auth_token }}";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    var options = new AvailablePhoneNumberListRequest();
    options.AreaCode = "510";
    
    var result = twilio.ListAvailableLocalPhoneNumbers("US", options);
    
    // Purchase the first number in the list
    var availableNumber = result.AvailablePhoneNumbers[0];
    var purchaseOptions = new PhoneNumberOptions();
    purchaseOptions.PhoneNumber = availableNumber.PhoneNumber;
    
    var number = twilio.AddIncomingPhoneNumber(purchaseOptions);
    Console.WriteLine(number.Sid);
    
  }
}