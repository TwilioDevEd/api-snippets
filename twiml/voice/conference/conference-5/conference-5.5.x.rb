require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
dial = Twilio::TwiML::Dial.new
dial.conference('SimpleRoom', muted: true)
response.append(dial)

puts response
