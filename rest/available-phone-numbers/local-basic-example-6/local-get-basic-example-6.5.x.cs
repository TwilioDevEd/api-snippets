// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Rest.Api.V2010.Account.AvailablePhoneNumberCountry;
class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/console
    string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string authToken = "your_auth_token";
    TwilioClient.Init(accountSid, authToken);

    var localResourceResultSet = LocalResource.Read("GB",
                                                    voiceEnabled: true);

    // Purchase the first number on the list
    var localResourceEnumerator = localResourceResultSet.GetEnumerator();
    if (localResourceEnumerator.MoveNext()) {
        var availableNumber = localResourceEnumerator.Current.PhoneNumber;
        var incomingPhoneNumber = IncomingPhoneNumberResource.Create(phoneNumber: availableNumber);
        Console.WriteLine(incomingPhoneNumber.Sid);
    }
  }
}
