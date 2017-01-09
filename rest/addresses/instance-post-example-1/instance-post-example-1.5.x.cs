// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        const string addressSid = "AD2a0747eba6abf96b7e3c3ff0b4530f6e";
        AddressResource.Update(addressSid,
                               customerName: "Customer 456",
                               street: "2 Hasselhoff Lane");
    }
}
