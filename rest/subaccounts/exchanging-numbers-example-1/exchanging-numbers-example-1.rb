# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'AC0132a3c49700934481addd5ce1659f04'
auth_token = '{{ auth_token }}'
@client = Twilio::REST::Client.new account_sid, auth_token
 
@subaccount = @client.accounts.get("AC00000000000000000000000000000001")
@number = @subaccount.incoming_phone_numbers.get("PN2a0747eba6abf96b7e3c3ff0b4530f6e")
@number.update(:account_sid => "AC00000000000000000000000000000002")
puts @number.phone_number
