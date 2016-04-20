from twilio.rest import TwilioRestClient

# To find these visit www.twilio.com/user/account
ACCOUNT_SID = "ACXXXXXXXX"
AUTH_TOKEN = "YYYYYYYY"

client = TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN)
for caller_id in client.caller_ids.iter():
    print caller_id.phone_number
    print caller_id.date_updated
