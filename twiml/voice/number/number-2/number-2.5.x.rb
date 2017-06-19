require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
dial = Twilio::TwiML::Dial.new
dial.number('858-987-6543')
dial.number('415-123-4567')
dial.number('619-765-4321')
response.append(dial)

puts response
