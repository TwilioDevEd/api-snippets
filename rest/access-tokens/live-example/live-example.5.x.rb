require 'twilio-ruby'

# Required for any Twilio Access Token
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
api_key = ENV['TWILIO_API_KEY']
api_secret = ENV['TWILIO_API_KEY_SECRET']

# Create a PlaybackGrant resource for a specific PlayerStreamer
# via the REST API
@client = Twilio::REST::Client.new(api_key, api_secret, account_sid)
playback_grant = @client.media
                        .player_streamer('VJXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                        .playback_grant
                        .create(ttl: 60)

# Wrap the grant you received from the API
# in a PlaybackGrant object
wrapped_playback_grant = Twilio::JWT::AccessToken::PlaybackGrant.new
wrapped_playback_grant.grant = playback_grant.grant

# Create an Access Token and attach the wrapped PlaybackGrant
token = Twilio::JWT::AccessToken.new(
  account_sid,
  api_key,
  api_secret,
  [wrapped_playback_grant]
)

# Generate the token
puts token.to_jwt
