// Download the twilio-csharp library from
// https://www.twilio.com/docs/libraries/csharp#installation
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account.Sip.IpAccessControlList;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        string authToken = "your_auth_token";

        TwilioClient.Init(accountSid, authToken);


        var ipAddress = IpAddressResource.Create(
            "AL32a3c49700934481addd5ce1659f04d2", "My office IP Address",
            "55.102.123.124");

        Console.WriteLine(ipAddress.Sid);
    }
}
