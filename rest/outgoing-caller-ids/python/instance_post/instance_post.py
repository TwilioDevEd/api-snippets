from twilio.rest import TwilioRestClient

# To find these visit www.twilio.com/user/account
ACCOUNT_SID = "ACXXXXXXXX"
AUTH_TOKEN = "YYYYYYYY"

client = TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN)
caller_id = client.caller_ids.get("PN1234")
caller_id.update(friendly_name="My New Friendly Name")
