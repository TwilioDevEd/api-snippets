using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Api.V2010;
using Twilio.Rest.Media.V1.PlayerStreamer;
using Twilio.Jwt.AccessToken;
using Newtonsoft.Json;


class Example
{
    static void Main(string[] args)
    {
        // These values are necessary for any access token
        // To set up environmental variables, see http://twil.io/secure
        string twilioAccountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        string twilioApiKey = Environment.GetEnvironmentVariable("TWILIO_API_KEY");
        string twilioApiSecret = Environment.GetEnvironmentVariable("TWILIO_API_SECRET");

        // Create a PlaybackGrant resource for a specific PlayerStreamer
        // via the REST API. The pathSid value should be the PlayerStreamer SID.
        TwilioClient.Init(twilioApiKey, twilioApiSecret, twilioAccountSid);
        var playbackGrant = PlaybackGrantResource.Create(
            ttl: 60,
            pathSid: "VJXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        );

        // Serialize the returned grant into <Dictionary<string, object>>
        var json = JsonConvert.SerializeObject(playbackGrant.Grant);
        var grantDictionary = JsonConvert.DeserializeObject<Dictionary<string, object>>(json);

        // Wrap the grant you received from the API
        // in a PlaybackGrant object
        var wrappedPlaybackGrant = new PlaybackGrant{Grant = grantDictionary};

        var grants = new HashSet<IGrant> { wrappedPlaybackGrant };

        // Create an Access Token generator and attach the PlaybackGrant
        var token = new Token(
            twilioAccountSid,
            twilioApiKey,
            twilioApiSecret,
            grants: grants);

        Console.WriteLine(token.ToJwt());
    }
}
