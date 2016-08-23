# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "{{#accountSid}}{{accountSid}}{{/accountSid}}"
auth_token  = "{{#authToken}}{{authToken}}{{/authToken}}"
client = TwilioRestClient(account_sid, auth_token)

call = client.calls.create(url="{{#voiceCallUrl}}{{voiceCallUrl}}{{/voiceCallUrl}}",
    to="{{#voiceCallClient}}{{voiceCallClient}}{{/voiceCallClient}}",
    from_="{{#fromPhoneNumber}}{{fromPhoneNumber}}{{/fromPhoneNumber}}")
print(call.sid)
