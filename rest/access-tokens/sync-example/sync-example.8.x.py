import os
from twilio.jwt.access_token import AccessToken
from twilio.jwt.access_token.grants import SyncGrant

# required for all twilio access tokens
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
api_key = os.environ['TWILIO_API_KEY']
api_secret = os.environ['TWILIO_API_KEY_SECRET']
twilio_sync_service = os.environ['TWILIO_SYNC_SERVICE_SID']

# required for Sync grant
identity = 'user'

# Create access token with credentials
token = AccessToken(account_sid, api_key, api_secret, identity=identity)

# Create a Sync grant and add to token
sync_grant = SyncGrant(
    # Create a "grant" which enables a client to use Sync as a given user
    service_sid=twilio_sync_service
)

token.add_grant(sync_grant)

# Return token info as JSON
print(token.to_jwt())
