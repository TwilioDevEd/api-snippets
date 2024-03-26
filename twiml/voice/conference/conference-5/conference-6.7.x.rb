require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial do |dial|
  dial.conference('SimpleRoom', muted: true)
end

puts response
