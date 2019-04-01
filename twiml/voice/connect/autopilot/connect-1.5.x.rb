require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.connect do |connect|
    connect.autopilot('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
end

puts response
