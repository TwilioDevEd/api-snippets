from twilio.rest import Client

account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"  # Your Account SID from www.twilio.com/console
api_key = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"  # You can generate this from www.twilio.com/console/runtime/api-keys/create
api_secret = "your_api_secret"  # You can generate this from www.twilio.com/console/runtime/api-keys/create
client = Client(api_key, api_secret, account_sid)
