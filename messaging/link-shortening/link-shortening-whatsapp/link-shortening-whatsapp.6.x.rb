# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Find your Account SID and Auth Token at twilio.com/console
# and set the environment variables. See http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages
  .create(
     shorten_urls: true,
     messaging_service_sid: 'MGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
     body: 'Visit this link to start earning rewards today! https://example.com/N6uAirXeREkpV2MW7kpV2MW7TAvh1zn4gEFMTAvh1zn4gEFMN6uAirXeRE',
     to: 'whatsapp:+15551212121'
   )

puts message.sid
