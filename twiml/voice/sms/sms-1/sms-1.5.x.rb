require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.sms('The king stay the king.', from: '+14105551234', to: '+14105556789')

puts response
