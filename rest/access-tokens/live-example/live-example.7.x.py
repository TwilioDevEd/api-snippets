import os
from twilio.jwt.access_token import AccessToken
from twilio.jwt.access_token.grants import PlaybackGrant
from twilio.rest import Client

# Required for all Twilio Access Tokens
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
api_key = os.environ['TWILIO_API_KEY']
api_secret = os.environ['TWILIO_API_KEY_SECRET']

# Create Access Token with credentials
token = AccessToken(account_sid, api_key, api_secret)

# Create a PlaybackGrant resource for a specific PlayerStreamer
# via the REST API
client = Client(api_key, api_secret, account_sid)
playback_grant = client.media \
                    .player_streamer('VJXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                    .playback_grant() \
                    .create(ttl=60)


# Wrap the grant you received from the API
# in a PlaybackGrant object and then attach that wrapped
# grant to your Access Token
wrapped_grant = PlaybackGrant(grant=playback_grant.grant)
token.add_grant(wrapped_grant)

# Return token info as JSON
print(token.to_jwt())
