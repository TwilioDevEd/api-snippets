// The C# helper library 5.x will support Pricing Messaging, for now we'll use a simple RestSharp HTTP client
using RestSharp;
using RestSharp.Authenticators;
using System;
using System.Collections.Generic;

public class Example
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
        request.Resource = $"v1/Messaging/Countries/EE";        
        var country = client.Execute<PricingMessagingCountry>(request).Data;
        
        foreach (var price in country.InboundSmsPrices)
        {
            Console.WriteLine(price.NumberType);
            Console.WriteLine($"Current price {price.CurrentPrice} {country.PriceUnit}");
        }
    }
}


class PricingMessagingCountry
{
    public string PriceUnit { get; set; }
    public List<SmsPrice> InboundSmsPrices { get; set; }
}

class SmsPrice
{
    public string NumberType { get; set; }
    public string BasePrice { get; set; }
    public string CurrentPrice { get; set; }
}