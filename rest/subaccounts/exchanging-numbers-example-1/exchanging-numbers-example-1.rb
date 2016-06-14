# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = '{{ auth_token }}'
@client = Twilio::REST::Client.new account_sid, auth_token
 
@subaccount = @client.accounts.get("ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
@number = @subaccount.incoming_phone_numbers.get("PN2a0747eba6abf96b7e3c3ff0b4530f6e")
@number.update(:account_sid => "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
puts @number.phone_number
