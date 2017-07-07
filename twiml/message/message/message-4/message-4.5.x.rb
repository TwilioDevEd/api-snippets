require 'twilio-ruby'

response = Twilio::TwiML::MessagingResponse.new
response.message('') do |message|
    message.body('Hello Jenny')
    message.media('https://demo.twilio.com/owl.png')
end

puts response
