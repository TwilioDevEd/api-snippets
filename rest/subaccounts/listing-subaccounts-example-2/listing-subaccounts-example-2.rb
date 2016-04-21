# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'AC32a3c49700934481addd5ce1659f04d2'
auth_token = '{{ auth_token }}'
@client = Twilio::REST::Client.new account_sid, auth_token


# Loop over accounts and print out a property for each one
@client.accounts.list({:friendly_name => "MySubaccount"}).each do |account|
    puts account.status
end
