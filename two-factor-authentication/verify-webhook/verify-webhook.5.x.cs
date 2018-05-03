using System.Security.Cryptography;
using Microsoft.AspNetCore.Http.Extensions;
using Newtonsoft.Json.Linq;
using System.Text.RegularExpressions;

namespace Test
{
    public class AuthyWebhook
    {
        private bool Verify(Microsoft.AspNetCore.Http.HttpRequest Request,
          Newtonsoft.Json.Linq.JObject JsonContent,
          string ApiKey)
        {
            // Read the nonce from the request
            var nonce = Request.Headers["x-authy-signature-nonce"];
            var method = Request.Method;
            var url = Request.GetDisplayUrl();
            List<String> bodyRequest = new List<String>();

            // Flatten
            var props = GetPropPaths(string.Empty, JsonContent);
            foreach (var kvp in props)
            {
                var encodedKey = System.Web.HttpUtility.UrlEncode(kvp.Item1);
                var encodedValue = System.Web.HttpUtility.UrlEncode(kvp.Item2);
                // uppercase all escaped url-encoded characters
                Regex reg = new Regex(@"%[a-f0-9]{2}");
                encodedKey = reg.Replace(encodedKey, m => m.Value.ToUpperInvariant());
                encodedValue = reg.Replace(encodedValue, m => m.Value.ToUpperInvariant());
                bodyRequest.Add(encodedKey + "=" + encodedValue);
            }

            // Sort the params
            bodyRequest.Sort();
            var parameters = String.Join("&", bodyRequest);

            // concatenate all together and separate by '|'
            var data = $"{nonce}|{method}|{url}|{parameters}";

            // compute the signature
            var encoding = new System.Text.ASCIIEncoding();
            byte[] ApiKeyBytes = encoding.GetBytes(ApiKey);
            byte[] DataBytes = encoding.GetBytes(data);
            using (var hmacsha256 = new HMACSHA256(ApiKeyBytes))
            {
                // Read the Authy Signature from the request
                var sig = Request.Headers["x-authy-signature"];

                // compare the message signature with your calculated signature
                byte[] hashmessage = hmacsha256.ComputeHash(DataBytes);
                var hash = Convert.ToBase64String(hashmessage);
                return hash == sig;
            }
        }

        private IEnumerable<Tuple<string, string>> GetPropPaths(string currPath, JObject obj)
        {
            foreach (var prop in obj.Properties())
            {
                var propPath = string.IsNullOrWhiteSpace(currPath) ? prop.Name : currPath + "[" + prop.Name + "]";

                if (prop.Value.Type == JTokenType.Object)
                {
                    foreach (var subProp in GetPropPaths(propPath, prop.Value as JObject))
                        yield return subProp;
                }
                else if (prop.Value.Type == JTokenType.Boolean)
                {
                    // Fix boolean type conversion to lowercase string
                    yield return new Tuple<string, string>(propPath, prop.Value.ToString().ToLower());
                }
                else
                {
                    yield return new Tuple<string, string>(propPath, prop.Value.ToString());
                }
            }
        }
    }
}
