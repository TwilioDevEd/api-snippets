# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
{{#accountSid}}account_sid = "{{accountSid}}"{{/accountSid}}
{{#authToken}}auth_token = "{{authToken}}"{{/authToken}}
@client = Twilio::REST::Client.new account_sid, auth_token

call = @client.account.calls.create(
    {{#fromPhoneNumber}}from: "{{fromPhoneNumber}}",{{/fromPhoneNumber}}
    {{#toPhoneNumber}}to: "{{toPhoneNumber}}",{{/toPhoneNumber}}
    {{#toVoiceClient}}to: "{{toVoiceClient}}",{{/toVoiceClient}}
    {{#callUrl}}url: "{{callUrl}}",{{/callUrl}}
    {{#sendDigitsVoice}}send_digits: "{{#sendDigitsVoice}}",{{/sendDigitsVoice}}
    {{#callMethod}}method: "{{#callMethod}}",{{/callMethod}}
    {{#callStatusCallback}}status_callback: "{{callStatusCallback}}",{{/callStatusCallback}}
    {{#callStatusCallbackMethod}}status_callback_method: "{{callStatusCallbackMethod}}",{{/callStatusCallbackMethod}}
    {{#callStatusCallbackEvent}}
    status_callback_event: [
    {{#callStatusCallbackEvents}}
        "{{.}}",
    {{/callStatusCallbackEvents}}
    ],
    {{/callStatusCallbackEvent}}
)
puts call.to
