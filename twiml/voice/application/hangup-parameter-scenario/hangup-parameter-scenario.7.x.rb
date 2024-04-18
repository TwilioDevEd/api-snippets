require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.say(message: "We're sorry. All of our agents are busy right now.")
response.say(message: 'We will call you back as soon as possible.')
response.say(message: 'Please stay on the line to be redirected to the main menu.')
response.hangup do |hangup|
    hangup.parameter(name: 'payment_collected', value: false)
end

puts response
