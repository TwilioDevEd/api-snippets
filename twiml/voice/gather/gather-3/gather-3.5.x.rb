require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.gather(action: '/process_gather.php', method: 'GET') do |gather|
  gather.say('Please enter your account number,\nfollowed by the pound sign')
end
response.say('We didn\'t receive any input. Goodbye!')

puts response
