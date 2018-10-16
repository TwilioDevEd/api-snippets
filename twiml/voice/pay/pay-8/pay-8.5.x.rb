require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.pay do |pay|
    pay.prompt(for: 'security-code', cardType: 'visa') do |prompt|
        prompt.say(message: 'Please enter security code for your visa card. It’s the 3 digits located in the back of your card')
end
end

puts response
