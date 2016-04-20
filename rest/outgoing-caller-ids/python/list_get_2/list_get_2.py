from twilio.rest import TwilioRestClient

# To find these visit www.twilio.com/user/account
ACCOUNT_SID = "ACXXXXXXXX"
AUTH_TOKEN = "YYYYYYYY"

client = TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN)
caller_ids = client.caller_ids.list(phone_number="+14158675309")
if caller_ids:
    print caller_ids[0].sid
    print caller_ids[0].uri
    print caller_ids[0].date_created
else:
    print "Sorry, no caller ids matching that phone number."
