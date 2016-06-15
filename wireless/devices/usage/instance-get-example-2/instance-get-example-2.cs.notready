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

      var usage = await
        Usage.Fetch("524116518656369")
          .SetStart("2016-05-01")
          .SetEnd("2016-05-31")
          .ExecuteAsync(restClient);

      Console.WriteLine(usage.Period['start']);
      Console.WriteLine(usage.Period['end']);
      Console.WriteLine(usage.DataCosts['total']);
    }

    static void Main(string[] args)
    {
      DoTask().Wait();
      Console.Write("Press any key to continue.");
      Console.ReadKey();
    }
  }
}