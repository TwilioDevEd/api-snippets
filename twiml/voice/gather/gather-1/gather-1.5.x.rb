require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.gather(input: 'speech dtmf', timeout: 3, num_digits: 1) do |gather|
  gather.say(message: 'Please press 1 or say sales for sales.')
end

puts response
