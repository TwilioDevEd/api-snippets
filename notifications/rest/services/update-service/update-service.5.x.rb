# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

client = Twilio::REST::Client.new(account_sid, auth_token)

service = client.notify.services('ISxxx')

service = service.update(
  friendly_name: 'NewFlowHipSlackChatDock',
  FacebookMessengerPageId: 'your_page_id',
  MessagingServiceSid: 'your_twilio_messaging_service_sid'
)

puts service
