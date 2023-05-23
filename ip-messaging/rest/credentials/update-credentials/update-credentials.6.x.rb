require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
client = Twilio::REST::Client.new(account_sid, auth_token)

# Update the credential
response = client.chat
                 .v2.credentials('CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                 .fetch.update(friendly_name: 'friendly_name')
puts response