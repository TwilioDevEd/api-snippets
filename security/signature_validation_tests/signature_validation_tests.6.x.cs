// Download the twilio-csharp library from
// https://www.twilio.com/docs/libraries/csharp#installation
using System;
using System.Collections.Generic;
using Twilio.Security;

class Example
{
    // Your Auth Token from twilio.com/console
    static readonly string AuthToken = Environment.GetEnvironmentVariable("AUTH_TOKEN");

    static async Task Main(string[] args)
    {
        // The Twilio request URL
        const string url = "https://mycompany.com/myapp";

        var parameters = new Dictionary<string, string>
        {
            {"CallSid", "CA1234567890ABCDE"},
            {"Caller", "+12349013030"},
            {"Digits", "1234"},
            {"From", "+12349013030"},
            {"To", "+18005551212"}
        };

        await TestUrl("POST", url, parameters, true);
        await TestUrl("POST", url, parameters, false);
        await TestUrl("GET", url, parameters, true);
        await TestUrl("GET", url, parameters, false);
    }

    private static async Task TestUrl(string method, string url, IDictionary<string, string> parameters, bool valid) {
        var client = new HttpClient();
        if(method == "GET")
        {
            var query = string.Join("&",parameters.Select(
                kvp => $"{kvp.Key}={HttpUtility.UrlEncode(kvp.Value)}"));
            url += '?' + query;
            parameters = new Dictionary<string, string>();
        }

        var signature = ComputeSignature(valid ? url : "http://invalid.com", parameters);
        client.DefaultRequestHeaders.Add("X-Twilio-Signature", signature);
    
        HttpResponseMessage response;
        if(method == "GET") {
            response = await client.GetAsync(url);
        } else {
            response = await client.PostAsync(url, new FormUrlEncodedContent(parameters));
        }

        var validStr = valid ? "valid" : "invalid";
        Console.WriteLine($"HTTP {method} with {validStr} signature returned {response.StatusCode}");
    }

    private static string ComputeSignature(string url, IDictionary<string, string> parameters){
        var b = new StringBuilder(url);
        if (parameters != null)
        {
            var sortedKeys = new List<string>(parameters.Keys);
            sortedKeys.Sort(StringComparer.Ordinal);

            foreach (var key in sortedKeys)
            {
                b.Append(key).Append(parameters[key] ?? "");
            }
        }

        var hmac = new HMACSHA1(Encoding.UTF8.GetBytes(AuthToken));
        var hash = hmac.ComputeHash(Encoding.UTF8.GetBytes(b.ToString()));
        return Convert.ToBase64String(hash);
    }
}
