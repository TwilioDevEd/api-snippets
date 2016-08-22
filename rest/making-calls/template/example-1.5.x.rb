# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = "{{accountSid}}"
auth_token = "{{authToken}}"
@client = Twilio::REST::Client.new account_sid, auth_token

call = @client.account.calls.create(
    {{#fromPhoneNumber}}from: "{{fromPhoneNumber}}",{{/fromPhoneNumber}}
    {{#toPhoneNumber}}to: "{{toPhoneNumber}}",{{/toPhoneNumber}}
    {{#toVoiceClient}}to: "{{toVoiceClient}}",{{/toVoiceClient}}
    {{#callUrl}}url: "{{callUrl}}",{{/callUrl}}
    {{#applicationSid}}application_sid: "{{applicationSid}}",{{/applicationSid}}
    {{#sendDigitsVoice}}send_digits: "{{sendDigitsVoice}}",{{/sendDigitsVoice}}
    {{#callMethod}}method: "{{callMethod}}",{{/callMethod}}
    {{#callStatusCallback}}status_callback: "{{callStatusCallback}}",{{/callStatusCallback}}
    {{#callStatusCallbackMethod}}status_callback_method: "{{callStatusCallbackMethod}}",{{/callStatusCallbackMethod}}
    {{#callFallbackUrl}}fallback_url: "{{callFallbackUrl}}",{{/callFallbackUrl}}
    {{#callFallbackMethod}}fallback_method: "{{callFallbackMethod}}",{{/callFallbackMethod}}
    {{#callIfMachine}}if_machine: "{{callIfMachine}}",{{/callIfMachine}}
    {{#callTimeout}}timeout: "{{callTimeout}}",{{/callTimeout}}
    {{#callRecord}}record: "{{callRecord}}",{{/callRecord}}
    {{#callRecordingChannels}}recording_channels: "{{callRecordingChannels}}",{{/callRecordingChannels}}
    {{#callRecordingStatusCallback}}recording_status_callback: "{{callRecordingStatusCallback}}",{{/callRecordingStatusCallback}}
    {{#callRecordingStatusCallbackMethod}}recording_status_callback_method: "{{callRecordingStatusCallbackMethod}}",{{/callRecordingStatusCallbackMethod}}
    {{#callSipAuthUsername}}sip_auth_username: "{{callSipAuthUsername}}",{{/callSipAuthUsername}}
    {{#callSipAuthPassword}}sip_auth_password: "{{callSipAuthPassword}}",{{/callSipAuthPassword}}
    {{#callStatusCallbackEvent}}
    status_callback_event: [
    {{#callStatusCallbackEvents}}
        "{{.}}",
    {{/callStatusCallbackEvents}}
    ],
    {{/callStatusCallbackEvent}}
)
puts call.to
