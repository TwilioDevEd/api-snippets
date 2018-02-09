using System.Security.Cryptography;

namespace Test
{
    public class AuthyWebhook
    {
        private string Verify(System.Web.HttpRequestBase Request, string ApiKey)
        {
            // Read the nonce from the request
            var nonce = Request.Headers["x-authy-signature-nonce"];
            var method = Request.HttpMethod;
            var url = Request.Url.AbsoluteUri;
            var bodyRequest = new string [];
            foreach (string key in Request.Form.Keys)
            {
                bodyRequest.Add(key + "=" + Request.Form[key]);
            }
            // Sort the params
            var params = String.join("&", bodyRequest.Sort());

            // concatenate all together and separate by '|'
            var data = $"{nonce}|{method}|{url}|{params}";

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
                return Convert.ToBase64String(hashmessage) == sig;
            }
        }
    }
}
