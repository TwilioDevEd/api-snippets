// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;
class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/console
    string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string authToken = "your_auth_token";
    TwilioClient.Init(accountSid, authToken);

    var friendlyName = "My Company Line";
    var voiceUrl = new Uri("http://demo.twilio.com/docs/voice.xml");
    var phoneNumber = new PhoneNumber("+15105647903");
    var voiceMethod = "GET";
    var number = IncomingPhoneNumberResource.Create(friendlyName: friendlyName,
                                                    voiceUrl: voiceUrl,
                                                    phoneNumber: phoneNumber,
                                                    voiceMethod: voiceMethod);

    Console.WriteLine(number.Sid);
  }
}
