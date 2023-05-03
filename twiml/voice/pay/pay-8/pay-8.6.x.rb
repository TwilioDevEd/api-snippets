require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.pay do |pay|
  pay.prompt(for: 'security-code', card_type: 'visa') do |prompt|
    prompt
      .say(message: 'Please enter security code for your Visa card. It’s the 3 digits located on the back of your card')
  end
end

puts response
