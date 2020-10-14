using System;
using Twilio;
using Twilio.Rest.Proxy.V1.Service;


class Example
{
    static void Main(string[] args)
    {
      // Find your Account Sid, Auth Token and Proxy Service sid at twilio.com/console
      // To set up environmental variables, see http://twil.io/secure
      const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
      const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
      const string proxyServiceSid = "KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
      TwilioClient.Init(accountSid, authToken);

      var session = SessionResource.Create(proxyServiceSid, "MyFirstSession");

      Console.WriteLine(session.Sid);
    }
}
