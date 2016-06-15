// Download the **Next-Gen** twilio-csharp library from:
// twilio.com/docs/libraries/csharp#installation-nextgen
using System;
using System.Threading.Tasks;
using Twilio.Clients;
using Twilio.Resources.Preview.Wireless;

namespace TwilioApp
{
  class Program
  {
    static async Task DoTask()
    {
      var accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
      var authToken = "your_auth_token";

      var restClient = new TwilioRestClient(accountSid, authToken);

      var devices = await Device.Read().ExecuteAsync();
      foreach (var d in devices) {
        Console.WriteLine(d.FriendlyName);
      }
    }

    static void Main(string[] args)
    {
      DoTask().Wait();
      Console.Write("Press any key to continue.");
      Console.ReadKey();
    }
  }
}