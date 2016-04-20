from twilio.rest import TwilioRestClient

# To find these visit www.twilio.com/user/account
ACCOUNT_SID = "ACXXXXXXXX"
AUTH_TOKEN = "YYYYYYYY"

client = TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN)
number_to_validate = "+14105551234"
response = client.caller_ids.validate(number_to_validate)
print response.validation_code
