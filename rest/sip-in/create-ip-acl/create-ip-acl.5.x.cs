// Download the twilio-csharp library from
// https://www.twilio.com/docs/libraries/csharp#installation
using System;
using Twilio;
using Twilio.Rest.Trunking.V1.Trunk;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        string authToken = "your_auth_token";

        TwilioClient.Init(accountSid, authToken);

        var ipAccessControlList = IpAccessControlListResource.Create(
            "My new acl", "CLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");

        Console.WriteLine(ipAccessControlList.Sid);
    }
}
