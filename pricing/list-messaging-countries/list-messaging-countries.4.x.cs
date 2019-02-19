// The C# helper library 5.x will support Pricing Messaging, for now we'll use a simple RestSharp HTTP client
using RestSharp;
using RestSharp.Authenticators;
using System;
using System.Collections.Generic;

class Example
{
    public static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";

        var client = new RestClient();
        client.Authenticator = new HttpBasicAuthenticator(accountSid, authToken);
        client.BaseUrl = new Uri("https://pricing.twilio.com/");

        var request = new RestRequest(Method.GET);
        request.Resource = "v1/Voice/Countries";
        var response = client.Execute<VoiceCountriesResponse>(request);

        while (response.Data.Meta.NextPageUrl != null)
        {
            foreach (var country in response.Data.Countries)
            {
                Console.WriteLine(country.IsoCountry);
            }

            request.Resource = response.Data.Meta.NextPageUrl.PathAndQuery;
            response = client.Execute<VoiceCountriesResponse>(request);
        }
    }
}


class VoiceCountry
{
    public string Country { get; set; }
    public string IsoCountry { get; set; }
    public Uri Url { get; set; }
}

class VoiceCountriesResponse
{
    public List<VoiceCountry> Countries { get; set; }
    public Meta Meta { get; set; }
}

class Meta
{
    public int Page { get; set; }
    public int PageSize { get; set; }
    public Uri FirstPageUrl { get; set; }
    public Uri PreviousPageUrl { get; set; }
    public Uri Url { get; set; }
    public Uri NextPageUrl { get; set; }
    public string Key { get; set; }
}