require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.pay do |pay|
  pay.prompt(for: 'security-code', card_type: 'amex') do |prompt|
    prompt
      .say(message: 'Please enter security code for your American Express card. It’s the 4 digits located on the front of your card')
  end
end

puts response
