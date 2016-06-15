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

      var plan = await
        RatePlan.Fetch("us-automotive")
          .ExecuteAsync(restClient);

      Console.WriteLine(plan.Sid);
      Console.WriteLine(plan.Alias);
    }

    static void Main(string[] args)
    {
      DoTask().Wait();
      Console.Write("Press any key to continue.");
      Console.ReadKey();
    }
  }
}