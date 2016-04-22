# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACde6f1e11047ebd6fe7a55f120be3a900'
auth_token = '{{ auth_token }}'
@client = Twilio::REST::Client.new account_sid, auth_token

@numbers = @client.account.available_phone_numbers.get('GB').local.list(:voice_enabled => "true")

# Purchase the number
@number = @numbers[0].phone_number
@client.account.incoming_phone_numbers.create(:phone_number => @number)
