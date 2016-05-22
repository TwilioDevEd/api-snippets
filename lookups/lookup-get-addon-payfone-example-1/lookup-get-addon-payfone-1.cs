using Newtonsoft.Json;
using RestSharp;
using RestSharp.Authenticators;

// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;

class Example
{
  static void Main(string[] args)
  {
    // The C# helper library will support Add-ons in June 2016, for now we'll use a simple RestSharp HTTP client
    var client = new RestClient("https://lookups.twilio.com/v1/PhoneNumbers/+16502530000/?AddOns=payfone_tcpa_compliance&AddOns.payfone_tcpa_compliance.RightPartyContactedDate=20160101");
    // Find your Account Sid and Auth Token at twilio.com/user/account
    client.Authenticator = new HttpBasicAuthenticator("ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", "{{ auth_token }}");
    var request = new RestRequest(Method.GET);
    request.AddHeader("content-type", "application/json");
    request.AddHeader("accept", "application/json");

    IRestResponse response = client.Execute(request);

    dynamic result = JsonConvert.DeserializeObject(response.Content, new JsonSerializerSettings { ContractResolver = new SnakeCaseContractResolver() });

    Console.WriteLine(result.add_ons.results.payfone_tcpa_compliance.result.Description);
    Console.WriteLine(result.add_ons.results.payfone_tcpa_compliance.result.Response.NumberMatch);
  }
}