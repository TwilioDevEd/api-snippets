require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.gather(input: 'speech', action: '/completed') do |gather|
  gather.say(message: "Welcome to Twilio, please tell us why you're calling")
end

puts response
