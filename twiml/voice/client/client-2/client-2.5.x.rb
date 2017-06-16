require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new 
dial = Twilio::TwiML::Dial.new caller_id: '+1888XXXXXXX'
dial.number '858-987-6543'
dial.client 'jenny'
dial.client 'tommy'
response.append dial

puts response
