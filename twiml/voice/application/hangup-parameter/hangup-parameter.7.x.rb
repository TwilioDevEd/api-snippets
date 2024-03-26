require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.hangup do |hangup|
    hangup.parameter(name: 'hangup_reason', value: 'no agents available')
end

puts response
