require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
dial = Twilio::TwiML::Dial.new
dial.conference('Customer Waiting Room', beep: false)
response.append(dial)

puts response
