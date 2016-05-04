# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = '{{ account_sid }}'
auth_token = '{{ auth_token }}'
@client = Twilio::REST::Client.new account_sid, auth_token


# Loop over credentials and print out a property for each one
@client.account.sip.credential_lists.get("CL32a3c49700934481addd5ce1659f04d2").credentials.list.each do |credential|
    puts credential.username
end
