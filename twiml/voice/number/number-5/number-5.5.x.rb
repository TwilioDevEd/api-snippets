require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial do |dial|
    dial.number('415-123-4567', url: 'http://example.com/agent_screen_call')
end

puts response
