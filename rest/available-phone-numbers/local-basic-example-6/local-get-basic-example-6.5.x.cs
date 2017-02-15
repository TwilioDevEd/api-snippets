// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Rest.Api.V2010.Account.AvailablePhoneNumberCountry;
using System.Linq;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        var localAvailableNumbers = LocalResource.Read("GB",
                                                      voiceEnabled: true);

        // Purchase the first number on the list
        var firstNumber = localAvailableNumbers.First();
        var incomingPhoneNumber = IncomingPhoneNumberResource.Create(
            phoneNumber: firstNumber.PhoneNumber);

        Console.WriteLine(incomingPhoneNumber.Sid);
    }
}
