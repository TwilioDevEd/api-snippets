# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems' # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
recording_sid = 'RE557ce644e5ab84fa21cc21112e22c485'
@client = Twilio::REST::Client.new account_sid, auth_token

@client.api.v2010.accounts(account_sid)
       .recordings(recording_sid)
       .fetch
