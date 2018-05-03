using Newtonsoft.Json;
using RestSharp;
using RestSharp.Authenticators;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;

class Example
{
    static void Main(string[] args)
    {
        // The C# helper library will support Add-ons in June 2016, for now we'll use a simple RestSharp HTTP client
        var client = new RestClient("https://lookups.twilio.com/v1/PhoneNumbers/+16502530000/?AddOns=payfone_tcpa_compliance&AddOns.payfone_tcpa_compliance.RightPartyContactedDate=20160101");
        // Find your Account Sid and Auth Token at twilio.com/user/account
        client.Authenticator = new HttpBasicAuthenticator("ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", "your_auth_token");
        var request = new RestRequest(Method.GET);
        request.AddHeader("content-type", "application/json");
        request.AddHeader("accept", "application/json");

        IRestResponse response = client.Execute(request);

        dynamic result = JsonConvert.DeserializeObject<Dictionary<string, string>>(
            response.Content, new JsonSerializerSettings { ContractResolver = new SnakeCaseContractResolver() });

        Console.WriteLine(result.add_ons.results.payfone_tcpa_compliance.result.Description);
        Console.WriteLine(result.add_ons.results.payfone_tcpa_compliance.result.Response.NumberMatch);
    }

    public class SnakeCaseContractResolver : DefaultContractResolver
    {
        protected override string ResolvePropertyName(string propertyName)
        {
            return GetSnakeCase(propertyName);
        }

        private string GetSnakeCase(string input)
        {
            if (string.IsNullOrEmpty(input))
                return input;

            var buffer = "";

            for (var i = 0; i < input.Length; i++)
            {
                var isLast = (i == input.Length - 1);
                var isSecondFromLast = (i == input.Length - 2);

                var curr = input[i];
                var next = !isLast ? input[i + 1] : '\0';
                var afterNext = !isSecondFromLast && !isLast ? input[i + 2] : '\0';

                buffer += char.ToLower(curr);

                if (!char.IsDigit(curr) && char.IsUpper(next))
                {
                    if (char.IsUpper(curr))
                    {
                        if (!isLast && !isSecondFromLast && !char.IsUpper(afterNext))
                            buffer += "_";
                    }
                    else
                        buffer += "_";
                }

                if (!char.IsDigit(curr) && char.IsDigit(next))
                    buffer += "_";
                if (char.IsDigit(curr) && !char.IsDigit(next) && !isLast)
                    buffer += "_";
            }

            return buffer;
        }
    }
}
