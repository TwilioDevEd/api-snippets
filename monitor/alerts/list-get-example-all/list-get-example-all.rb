# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACda6f132a3c49700934481addd5ce1659'
auth_token = '{{ auth_token }}'
@client = Twilio::REST::MonitorClient.new account_sid, auth_token


# Loop over alerts and print out a property for each one
@client.account.alerts.list.each do |alert|
    puts alert.alert_text
end