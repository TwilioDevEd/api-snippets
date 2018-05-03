from twilio.access_token import AccessToken, IpMessagingGrant

# required for all twilio access tokens
account_sid = 'ACxxxxxxxxxxxx'
api_key = 'SKxxxxxxxxxxxx'
api_secret = 'xxxxxxxxxxxxxx'

# required for IP messaging grants
ipm_service_sid = 'ISxxxxxxxxxxxx'
identity = 'user@example.com'

# Create access token with credentials
token = AccessToken(account_sid, api_key, api_secret, identity)

# Create an IP Messaging grant and add to token
ipm_grant = IpMessagingGrant(
    service_sid=ipm_service_sid
)
token.add_grant(ipm_grant)

# Return token info as JSON
print(token.to_jwt())
