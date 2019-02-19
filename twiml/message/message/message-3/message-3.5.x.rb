require 'twilio-ruby'

response = Twilio::TwiML::MessagingResponse.new
response.message(action: '/SmsHandler.php', method: 'POST',
                 body: 'Store Location: 123 Easy St.')

puts response
