require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new 
gather = Twilio::TwiML::Gather.new action: '/process_gather.php', method: 'GET'
gather.say 'Enter something, or not'
response.append gather
response.redirect '/process_gather.php?Digits=TIMEOUT', method: 'GET'

puts response
