require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
service_sid = 'ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
@client = Twilio::REST::Client.new(account_sid, auth_token)
service = @client.chat.v2.services(service_sid)

# Update the channel
my_channel_sid = 'CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
channel = service.channels(my_channel_sid).fetch
channel_updated = channel.update(unique_name: 'Something Different')
puts "The \"#{channel.unique_name}\" channel " \
     "has become the \"#{channel_updated.unique_name}\" channel."
