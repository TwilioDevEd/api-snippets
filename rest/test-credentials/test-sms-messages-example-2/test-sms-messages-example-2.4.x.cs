// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        string authToken = "your_auth_token";
        var client = new TwilioRestClient(accountSid, authToken);

        var message = client.SendMessage("+15005550006", "+15005550009", "Hey Mr Nugget, you the bomb!");
        Console.WriteLine(message.Sid);
    }
}
