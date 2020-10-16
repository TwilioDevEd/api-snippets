# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

token = @client.tokens.create

puts token.username
