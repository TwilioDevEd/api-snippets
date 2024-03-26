require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.pay do |pay|
  pay.prompt(for: 'payment-card-number') do |prompt|
    prompt
      .say(message: 'Please enter your 16 digit Visa or Mastercard number.')
  end
end

puts response
