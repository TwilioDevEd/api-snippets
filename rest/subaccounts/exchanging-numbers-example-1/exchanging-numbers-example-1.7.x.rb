# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Your Account Sid and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
sub_account_sid = ENV['TWILIO_SUBACCOUNT_SID']
@client = Twilio::REST::Client.new(account_sid, auth_token)

incoming_phone_number = @client
  .incoming_phone_numbers('PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .update(account_sid: sub_account_sid)

puts incoming_phone_number.friendly_name
