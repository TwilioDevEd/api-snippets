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
    static void Main(string[] args)
    {
      DoTask().Wait();
      Console.Write("Press any key to continue.");
      Console.ReadKey();
    }

    static async Task DoTask()
    {
      var accountSid = "{{ account_sid }}";
      var authToken = "{{ auth_token }}";

      var restClient = new TwilioRestClient(accountSid, authToken);

      var device = await
        DeviceResource.Create("{{ rate_plan_sid }}")
          .SetAlias("996224413905003")
          .SetFriendlyName("Charlie's SmartMeter")
          .ExecuteAsync(restClient);

      Console.WriteLine(device.FriendlyName);
    }
  }
}