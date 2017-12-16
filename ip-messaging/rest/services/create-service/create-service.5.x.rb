require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

client = Twilio::REST::Client.new(account_sid, auth_token)

# Create a new service and make note of that service's SID.
new_service = client.chat.v2
                    .services.create(friendly_name: 'An example service')
puts "Created Chat service #{new_service.sid}"
