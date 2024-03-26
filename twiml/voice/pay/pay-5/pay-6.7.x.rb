require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.pay do |pay|
  pay.prompt(for: 'payment-card-number') do |prompt|
    prompt.play(url: 'https://myurl.com/twilio/twiml/audio/card_number.mp3')
  end
end

puts response
