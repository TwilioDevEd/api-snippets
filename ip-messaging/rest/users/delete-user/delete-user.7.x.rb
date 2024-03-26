require 'twilio-ruby'

# Get your Account SID, Auth Token, Service SID and Channel SID
# from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
service_sid = 'ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Delete the user
service = @client.chat.v2.services(service_sid)
user = service.users('USXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch
response = user.delete
puts response
