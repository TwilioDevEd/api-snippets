from twilio.access_token import AccessToken

# You will need your Account Sid and a SigningKey Sid and Secret
# to generate an Access Token for your SDK endpoint to connect to Twilio.

account_sid = "{{ account_sid }}"
signingkey_sid = SID
signingkey_secret = SECRET

token = AccessToken(signingkey_sid, account_sid, signingkey_secret)
token.add_endpoint_grant(ENDPOINT_ADDRESS)
token.enable_nts()
print token.to_jwt()
