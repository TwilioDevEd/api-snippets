// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACdc5f132a3c49700934481addd5ce1659";
    string AuthToken = "{{ auth_token }}";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);
    var options = new AddressListRequest();
    options.CustomerName = "Customer 123";

    var addresses = twilio.ListAddresses(options);

    foreach (var address in addresses.Addresses)
    {
      Console.WriteLine(address.FriendlyName);
    }
  }
}
