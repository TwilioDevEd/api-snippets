require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
dial = Twilio::TwiML::Dial.new
dial.number('415-123-4567', send_digits: 'wwww1928')
response.append(dial)

puts response
