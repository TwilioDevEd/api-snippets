using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Api.V2010;
using Twilio.Jwt.AccessToken;

class Example
{
    static void Main(string[] args)
    {
        // These values are necessary for any access token
        // To set up environmental variables, see http://twil.io/secure
        const string twilioAccountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string twilioApiKey = Environment.GetEnvironmentVariable("TWILIO_API_KEY");
        const string twilioApiSecret = Environment.GetEnvironmentVariable("TWILIO_API_SECRET");

        // Create a PlaybackGrant resource for a specific PlayerStreamer
        // via the REST API. The pathSid value should be the PlayerStreamer SID.
        TwilioClient.Init(twilioApiKey, twilioApiSecret, twilioAccountSid);
        var playbackGrant = PlaybackGrantResource.Create(
            ttl: 60,
            pathSid: "VJXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        );

        // Wrap the grant you received from the API
        // in a PlaybackGrant object and then attach that wrapped
        // grant to your Access Token
        var wrappedPlaybackGrant = new PlaybackGrant();
        wrappedPlaybackGrant.Grant = playbackGrant.Grant;

        var grants = new HashSet<IGrant> { wrappedPlaybackGrant };

        // Create an Access Token generator and attach the grants
        var token = new Token(
            twilioAccountSid,
            twilioApiKey,
            twilioApiSecret,
            grants: grants);

        Console.WriteLine(token.ToJwt());
    }
}
