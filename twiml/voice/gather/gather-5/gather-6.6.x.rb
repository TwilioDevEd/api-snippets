require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.gather(action: '/process_gather.php', method: 'GET') do |gather|
  gather.say(message: 'Enter something, or not')
end
response.redirect('/process_gather.php?Digits=TIMEOUT', method: 'GET')

puts response
