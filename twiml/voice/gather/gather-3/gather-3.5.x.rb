require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
gather = Twilio::TwiML::Gather.new(action: '/process_gather.php', method: 'GET')
gather.say('Please enter your account number,\nfollowed by the pound sign')
response.append(gather)
response.say('We didn\'t receive any input. Goodbye!')

puts response
