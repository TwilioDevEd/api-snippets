require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
gather = Twilio::TwiML::Gather.new(input: 'speech dtmf', timeout: 3,
  num_digits: 1)
gather.say('Please press 1 or say sales for sales.')
response.append(gather)

puts response
