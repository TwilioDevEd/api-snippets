require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
service_sid = 'ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Delete a particular
channel_to_delete = 'CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
service = @client.chat.v2.services(service_sid)
response = service.channels(channel_to_delete).delete
puts response
