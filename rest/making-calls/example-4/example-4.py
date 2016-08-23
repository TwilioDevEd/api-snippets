# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "{{#accountSid}}{{accountSid}}{{/accountSid}}"
auth_token  = "{{#authToken}}{{authToken}}{{/authToken}}"
client = TwilioRestClient(account_sid, auth_token)

call = client.calls.create(
    url="{{#voiceCallUrl}}{{voiceCallUrl}}{{/voiceCallUrl}}",
    to="{{#toPhoneNumber}}{{toPhoneNumber}}{{/toPhoneNumber}}",
    from_="{{#fromPhoneNumber}}{{fromPhoneNumber}}{{/fromPhoneNumber}}",
    method="{{#getHttpMethod}}{{getHttpMethod}}{{/getHttpMethod}}",
    status_callback="{{#voiceStatusCallbackUrl}}{{voiceStatusCallbackUrl}}{{/voiceStatusCallbackUrl}}",
    status_callback_method="{{#postHttpMethod}}{{postHttpMethod}}{{/postHttpMethod}}",
    status_events=["{{#initiatedCallEvent}}{{initiatedCallEvent}}{{/initiatedCallEvent}}", "{{#ringingCallEvent}}{{ringingCallEvent}}{{/ringingCallEvent}}", "{{#answeredCallEvent}}{{answeredCallEvent}}{{/answeredCallEvent}}", "{{#completedCallEvent}}{{completedCallEvent}}{{/completedCallEvent}}"],
)
print(call.sid)
