from twilio.rest import Client

account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"  # Your Account SID from www.twilio.com/console
api_key = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"  # You can generate this from www.twilio.com/console/runtime/api-keys/create
api_secret = "your_api_secret"  # You can generate this from www.twilio.com/console/runtime/api-keys/create

# DANGER! This is insecure. See http://twil.io/secure
client = Client(api_key, api_secret, account_sid)

# Proof request to check credentials are working.
# Retrieving your account information
accounts = client.api.accounts.list()
for record in accounts:
    print(record.sid)
