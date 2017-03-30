from twilio.jwt.access_token import AccessToken
from twilio.jwt.access_token.grants import IpMessagingGrant

# required for all twilio access tokens
account_sid = 'ACxxxxxxxxxxxx'
api_key = 'SKxxxxxxxxxxxx'
api_secret = 'xxxxxxxxxxxxxx'

# required for IP messaging grants
ipm_service_sid = 'ISxxxxxxxxxxxx'
identity = 'user@example.com'
device_id = 'someiosdevice'
endpoint_id = "HipFlowSlackDockRC:{0}:{1}".format(identity, device_id)

# Create access token with credentials
token = AccessToken(account_sid, api_key, api_secret, identity=identity)

# Create an IP Messaging grant and add to token
ipm_grant = IpMessagingGrant(
        endpoint_id=endpoint_id,
        service_sid=ipm_service_sid)
token.add_grant(ipm_grant)

# Return token info as JSON
print(token.to_jwt())
