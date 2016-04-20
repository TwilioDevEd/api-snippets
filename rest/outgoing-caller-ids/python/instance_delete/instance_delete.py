from twilio.rest import TwilioRestClient

# To find these visit www.twilio.com/user/account
ACCOUNT_SID = "ACXXXXXXXX"
AUTH_TOKEN = "YYYYYYYY"

client = TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN)
client.caller_ids.delete("PN1234")
