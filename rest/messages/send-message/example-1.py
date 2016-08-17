from twilio.rest import TwilioRestClient

# put your own credentials here
ACCOUNT_SID = "{{#accountSid}}{{accountSid}}{{/accountSid}}"
AUTH_TOKEN = "{{#authToken}}{{authToken}}{{/authToken}}"

client = TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN)

client.messages.create(
    to="{{#toPhoneNumber}}{{toPhoneNumber}}{{/toPhoneNumber}}",
    from_="{{#fromPhoneNumber}}{{fromPhoneNumber}}{{/fromPhoneNumber}}",
    body="{{#messageBody}}{{messageBody}}{{/messageBody}}",
    media_url="{{#messageMediaUrl}}{{messageMediaUrl}}{{/messageMediaUrl}}",
)
