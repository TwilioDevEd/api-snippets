require 'twilio-ruby'

response = Twilio::TwiML::MessagingResponse.new
response.message(action: '/SmsHandler.php', method: 'POST',
                 message: 'Store Location: 123 Easy St.')

puts response
