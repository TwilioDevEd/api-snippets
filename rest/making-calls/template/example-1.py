# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token  = "your_auth_token"
client = TwilioRestClient(account_sid, auth_token)

call = client.calls.create(
    {{#fromPhoneNumber}}from_="{{fromPhoneNumber}}",{{/fromPhoneNumber}}
    {{#toPhoneNumber}}to="{{toPhoneNumber}}",{{/toPhoneNumber}}
    {{#toVoiceClient}}to="{{toVoiceClient}}",{{/toVoiceClient}}
    {{#callUrl}}url="{{callUrl}}",{{/callUrl}}
    {{#sendDigitsVoice}}send_digits="{{#sendDigitsVoice}}",{{/sendDigitsVoice}}
    {{#callMethod}}method: "{{#callMethod}}",{{/callMethod}}
    {{#callStatusCallback}}status_callback="{{callStatusCallback}}",{{/callStatusCallback}}
    {{#callStatusCallbackMethod}}status_callback_method="{{callStatusCallbackMethod}}",{{/callStatusCallbackMethod}}
    {{#callStatusCallbackEvent}}
    status_events=[
    {{#callStatusCallbackEvents}}
        "{{.}}",
    {{/callStatusCallbackEvents}}
    ],
    {{/callStatusCallbackEvent}}
)
print(call.sid)
