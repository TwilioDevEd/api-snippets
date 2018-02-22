require 'twilio-ruby'

response = Twilio::TwiML::MessagingResponse.new
response.message do |message|
  message.body('Hello World!')
end
response.redirect('https://demo.twilio.com/welcome/sms/')

puts response
