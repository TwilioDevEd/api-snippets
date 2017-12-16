require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial do |dial|
  dial.number('415-123-4567', send_digits: 'wwww1928')
end

puts response
