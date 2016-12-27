// Download the twilio-csharp library from twilio.com/docs/csharp/install
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

        // In the case you want to transfer numbers between subaccounts, you need to
        // know three things - the account SID of the phone number's current owner,
        // the account SID of the account you'd like to transfer the number to, and
        // the SID of the phone number you'd like to transfer
        const string currentOwnerSid = "ACyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy";
        const string newOwnerSid = "ACzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz";
        const string phoneNumberSid = "PNyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy";

        // Create an authenticated REST client
        TwilioClient.Init(accountSid, authToken);

        IncomingPhoneNumberResource.Update(phoneNumberSid,
                                           accountSid: newOwnerSid);
    }
}
