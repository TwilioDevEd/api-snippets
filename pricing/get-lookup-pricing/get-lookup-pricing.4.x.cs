// The C# helper library 5.x will support Pricing Messaging, for now we'll use a simple RestSharp HTTP client
using RestSharp;
using RestSharp.Authenticators;
using System;
using System.Collections.Generic;
using System.Linq;

class Example
{
    public static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string phoneNumber = "+15108675310";

        var client = new RestClient();
        client.Authenticator = new HttpBasicAuthenticator(accountSid, authToken);
        client.BaseUrl = new Uri("https://lookups.twilio.com/");

        var request = new RestRequest(Method.GET);
        request.Resource = $"v1/PhoneNumbers/{phoneNumber}?Type=carrier";
        var response = client.Execute<LookupPhoneNumberResponse>(request);

        var mcc = response.Data.Carrier.MobileCountryCode;
        var mnc = response.Data.Carrier.MobileNetworkCode;

        var countryCode = response.Data.CountryCode;

        client.BaseUrl = new Uri("https://pricing.twilio.com/");
        request.Resource = $"v1/Messaging/Countries/{countryCode}";
        var country = client.Execute<PricingMessagingCountry>(request).Data;

        var prices = country
            .OutboundSmsPrices
            .Where(price => price.Mcc.Equals(mcc) && price.Mnc.Equals(mnc))
            .SelectMany(price => price.Prices)
            .Where(price => price.NumberType.Equals("local"));
        foreach (var price in prices)
        {
            Console.WriteLine($"Country {countryCode}");
            Console.WriteLine($"Current price {price.BasePrice} {country.PriceUnit}");
            Console.WriteLine($"Current price {price.CurrentPrice} {country.PriceUnit}");
        }
    }
}


class LookupPhoneNumberResponse
{
    public string CountryCode { get; set; }
    public string PhoneNumber { get; set; }
    public CarrierInfo Carrier { get; set; }
}

class CarrierInfo
{
    public string MobileCountryCode { get; set; }
    public string MobileNetworkCode { get; set; }
}

class PricingMessagingCountry
{
    public string PriceUnit { get; set; }
    public List<SmsPriceInfo> OutboundSmsPrices { get; set; }
}

class SmsPriceInfo
{
    public string Mcc { get; set; }
    public string Mnc { get; set; }
    public string Carrier { get; set; }
    public List<SmsPrice> Prices { get; set; }
}

class SmsPrice
{
    public string NumberType { get; set; }
    public string BasePrice { get; set; }
    public string CurrentPrice { get; set; }
}